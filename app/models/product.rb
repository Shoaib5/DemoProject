class Product < ApplicationRecord
  validates :name ,:product_type, presence: true
  validates :price ,:quantity ,presence: true , numericality: true

  belongs_to :user
  has_many :comments ,dependent: :destroy
end
