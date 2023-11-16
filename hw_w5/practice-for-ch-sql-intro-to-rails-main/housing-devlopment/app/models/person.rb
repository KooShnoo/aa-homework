class Person < ApplicationRecord
  validates :name, :house, presence: true
  belongs_to :house
end
