class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :date_of_creation, :city, :user_id, :pictures_count

  def pictures_count
    object.pictures.count
  end
end
