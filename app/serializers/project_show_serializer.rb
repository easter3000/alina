class ProjectShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_of_creation, :city, :user_id, :pictures_count

  has_many :pictures

  class PictureSeliazer < ActiveModel::Serializer
    attributes :id, :name, :image_data
  end

  def pictures_count
    object.pictures.count
  end
end
