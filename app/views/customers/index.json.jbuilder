json.array!(@customers) do |customer|
  json.extract! customer, :id, :username, :email, :avatar, :signature
  json.url customer_url(customer, format: :json)
end
