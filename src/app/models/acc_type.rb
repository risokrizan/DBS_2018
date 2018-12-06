class AccType < ApplicationRecord
	has_many :accounts,  dependent: :destroy
end
