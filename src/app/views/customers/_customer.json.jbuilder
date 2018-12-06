json.extract! customer, :id, :first_name, :last_name, :birth_date, :id_card_number, :street, :city, :zip, :created_at, :updated_at
json.url customer_url(customer, format: :json)
