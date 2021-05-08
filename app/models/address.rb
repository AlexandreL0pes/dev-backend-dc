class Address < ApplicationRecord
  belongs_to :order
  belongs_to :state
end
