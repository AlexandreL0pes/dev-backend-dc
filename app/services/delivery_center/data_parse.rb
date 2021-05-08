class DeliveryCenter::DataParse
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def parse!
    processed_order = {}

    processed_order[:externalCode] = order[:id]
    processed_order[:storeId] = order[:store_id]
    processed_order[:subTotal] = order[:total_amount]
    processed_order[:total] = order[:total]
    processed_order[:dtOrderCreate] = DateTime.now.strftime("%FT%T.%LZ")
    processed_order[:deliveryFee] = order[:total_shipping]
    processed_order[:total_shipping] = order[:total_shipping].to_f
    processed_order[:total] = order[:total_amount_with_shipping]
    processed_order[:subTotal] = order[:total_amount]
    
        
    processed_order[:country] = order.dig(:shipping, :receiver_address,:country, :id)
    processed_order[:city] = order.dig(:shipping, :receiver_address,:city, :name)
    processed_order[:district] = order.dig(:shipping, :receiver_address,:neighborhood, :name)
    processed_order[:street] = order.dig(:shipping, :receiver_address,:street_name)
    processed_order[:complement] = order.dig(:shipping, :receiver_address,:comment)
    processed_order[:latitude] = order.dig(:shipping, :receiver_address,:latitude)
    processed_order[:longitude] = order.dig(:shipping, :receiver_address,:longitude)
    processed_order[:postalCode] = order.dig(:shipping, :receiver_address,:zip_code)
    
    processed_order[:number] = order.dig(:shipping, :receiver_address, :street_number)
    state_name = order.dig(:shipping, :receiver_address,:state,:name).to_s.force_encoding("utf-8")

    state = State.find_by(name: state_name)
    processed_order[:state] = state.code

    # Customer Data
    processed_order[:customer] = {
      :externalCode => order.dig(:buyer,:id).to_i,
      :name => order.dig(:buyer, :first_name).to_s + " " + order.dig(:buyer, :last_name).to_s,
      :email => order.dig(:buyer, :email),
      :contact => order.dig(:buyer, :phone, :code).to_s + order.dig(:buyer, :phone, :number).to_s,
    }

    # Items
    processed_order[:items] = order[:order_items].map do |item| 
      {
       :externalCode => item.dig(:item, :id),
       :name => item.dig(:item, :title),
       :price => item.dig(:unit_price).to_f,
       :quantity => item.dig(:quantity).to_i,
       :total => item.dig(:unit_price).to_f * item.dig(:quantity).to_i,
       :subItems => []
      }
    end

    processed_order[:payments] = order[:payments].map do |payment| 
      {
       :type => payment.dig(:payment_type).to_s,
       :value => payment.dig(:total_paid_amount).to_f
      }
    end

    puts "\n\n\n"
    puts processed_order
    puts "\n\n\n"
    processed_order
  end
end