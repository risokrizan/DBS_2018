class IncomeByCustommer < ApplicationRecord
  belongs_to :customer
  belongs_to :pool
end
