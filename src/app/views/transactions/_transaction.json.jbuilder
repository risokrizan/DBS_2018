json.extract! transaction, :id, :name, :type, :ammount, :date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
