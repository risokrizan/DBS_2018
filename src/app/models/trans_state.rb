class TransState < ApplicationRecord
	has_many :transactions,  dependent: :destroy
end
