class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :emial 
  has_many :recipes
  has_many :comments 
end
