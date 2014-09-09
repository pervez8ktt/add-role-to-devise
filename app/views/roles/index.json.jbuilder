json.array!(@roles) do |role|
  json.extract! role, :id, :role_name
  json.url role_url(role, format: :json)
end
