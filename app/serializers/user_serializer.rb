class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email 
  has_many :recipes
  has_many :comments 
end
