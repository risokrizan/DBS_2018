class Computer < ApplicationRecord
  belongs_to :customer
  has_many :mining_histories,  dependent: :destroy
end
