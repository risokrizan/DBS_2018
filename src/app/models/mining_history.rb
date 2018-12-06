class MiningHistory < ApplicationRecord
  belongs_to :computer
  belongs_to :pool
end
