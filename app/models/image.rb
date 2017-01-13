class Image < ApplicationRecord
  #connections
  belongs_to :category
  has_one :game
  has_one :platform
  has_many :values
  #validations
  validates_presence_of :file, :category_id

  def image_info(category_id)
    category_name = Category.find(category_id).name.singularize.to_sym
    self.send category_name
  end
end
