class Product < ApplicationRecord
  enum status: { draft: 0, published: 1}

  has_many :order_items , dependent: :destroy
  has_many :photos , dependent: :destroy
  

  accepts_nested_attributes_for :photos, allow_destroy: true, reject_if: lambda { |attrs|  attrs['image'].blank? }
end
