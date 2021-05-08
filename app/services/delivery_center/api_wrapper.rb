class DeliveryCenter::ApiWrapper
  attr_reader :conn

  def initialize
    @conn = Faraday.new(
      ENV.fetch('DELIVERY_CENTER_API_URL'),
      headers: {
        'X-Sent': DateTime.now.strftime('%Hh%M - %d/%m/%y')
      }
    )
  end
  
  def fetch!(data: {})
    status, body = post(data)

    return { status: status, errors: body } if status != 200

    { status: status }
  end

  private 

  def post(body)
    body = body.to_json
    response = conn.post('/', body)
    return response.status, response.body
  end
end