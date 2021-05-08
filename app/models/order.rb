class Order < ApplicationRecord
  has_one :address
  has_one :customer
  
  has_many :items
  has_many :payments
end
