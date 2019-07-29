class Project < ApplicationRecord
  belongs_to :user
  has_many :pictures, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :date_of_creation
end
