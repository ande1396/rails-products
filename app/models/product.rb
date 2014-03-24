class Product < ActiveRecord::Base
validates :name, :description, :pricing, :presence => "true"

belongs_to :category
has_many :comments 

end
