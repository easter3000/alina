class PictureSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :user_id, :project_name, :name

  def project_name
    object.project.name
  end
end
