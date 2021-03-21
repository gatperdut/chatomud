class SuperareaSerializer < ActiveModel::Serializer

  attributes :id, :name

  has_many :areas

end
