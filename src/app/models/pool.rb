class Pool < ApplicationRecord
  belongs_to :bank
  belongs_to :currency
  has_many :income_by_custommers,  dependent: :destroy
  has_many :mining_histories,  dependent: :destroy
end
