class Bank < ApplicationRecord
	has_many :pools,  dependent: :destroy
	has_many :accounts,  dependent: :destroy
end
