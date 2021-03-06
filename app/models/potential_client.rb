class PotentialClient < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name
end
