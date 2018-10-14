class MoviesSerializer < ActiveModel::Serializer
  attributes :id, :title, :external_id, :status
end
