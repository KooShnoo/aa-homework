class House < ApplicationRecord
  validates :address, presence: true
  has_many(
    :residents,
    class_name: Person.to_s,
  )
end
