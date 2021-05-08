class Order < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :customer, dependent: :destroy
  
  has_many :items, dependent: :destroy
  has_many :payments, dependent: :destroy
end
