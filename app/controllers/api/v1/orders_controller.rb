module Api::V1
  class OrdersController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def status 
      render json: { date_time: DateTime.now }
    end

    def create

      parsed_data = DeliveryCenter::DataParse.new(params).parse!
  
      response = DeliveryCenter::ApiWrapper.new.fetch!(data: parsed_data)

      if not response[:errors]
        state = State.find_by(code: parsed_data[:state])

        order = Order.create(
          external_code: parsed_data[:externalCode],
          store_id: parsed_data[:storeId],
          subtotal: parsed_data[:subTotal],
          delivery_fee: parsed_data[:deliveryFee],
          total: parsed_data[:total],
          created_date: parsed_data[:dtOrderCreate],
        )

        customer = Customer.create(
          external_code: parsed_data[:customer][:externalCode],
          name: parsed_data[:customer][:name],
          email: parsed_data[:customer][:email],
          contact: parsed_data[:customer][:contact],
          order: order
        )

        address = Address.create(
          state: state, 
          country: parsed_data[:country], 
          city: parsed_data[:city], 
          district: parsed_data[:district],
          street: parsed_data[:street],
          complement: parsed_data[:complement],
          latitude: parsed_data[:latitude],
          longitude: parsed_data[:longitude],
          postal_code: parsed_data[:postalCode],
          number: parsed_data[:number],
          order: order
        )
        
        parsed_data[:items].each do |item|
          order.items.create(
            external_code: parsed_data[:externalCode],
            name: parsed_data[:name],
            price: parsed_data[:price],
            quantity: parsed_data[:quantity],
            total: parsed_data[:total],
            sub_items: parsed_data[:subItems],
          )
        end
                
        parsed_data[:payments].each do |payment|
          Payment.create(
            type_payment: payment[:type].to_s, 
            value: payment[:value],
            order_id: order.id
          )
        end
        

        render json: { message: "Order was created."}
      else 
        render json: { message: "Order creation failed, verify your data.", errors: response[:errors] }, status: 400
      end

    end
  end
end