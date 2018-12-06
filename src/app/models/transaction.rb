class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :trans_state
  belongs_to :trans_type
  belongs_to :currency
end
