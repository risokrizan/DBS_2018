class Customer < ApplicationRecord
	has_many :income_by_custommers,  dependent: :destroy
	has_many :computers,  dependent: :destroy
	has_many :accounts,  dependent: :destroy
end
