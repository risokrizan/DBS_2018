class Currency < ApplicationRecord
	has_many :pools
	has_many :transactions
	has_many :accounts
end
