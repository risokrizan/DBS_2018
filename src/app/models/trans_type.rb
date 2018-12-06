class TransType < ApplicationRecord
	has_many :transactions,  dependent: :destroy
end
