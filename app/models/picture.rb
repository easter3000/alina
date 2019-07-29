class Picture < ApplicationRecord
  include ImageUploader::Attachment.new(:image)
  belongs_to :project

  validates_presence_of :name
  validates_presence_of :project_id
  # validates_presence_of :image_data
end
