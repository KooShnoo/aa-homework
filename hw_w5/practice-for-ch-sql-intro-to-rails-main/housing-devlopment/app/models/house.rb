# == Schema Information
#
# Table name: houses
#
#  id          :bigint           not null, primary key
#  address     :string
#  resident_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class House < ApplicationRecord
  validates :address, presence: true
  has_many(
    :residents,
    class_name: Person.to_s
  )
end
