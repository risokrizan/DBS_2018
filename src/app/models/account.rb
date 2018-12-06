class Account < ApplicationRecord
  belongs_to :customer
  belongs_to :bank
  belongs_to :acc_type
  belongs_to :currency
  has_many :transactions, dependent: :destroy
end
