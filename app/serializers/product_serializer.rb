class ProductSerializer < ActiveModel::Serializer
  attributes :url, :aim_price, :description
end