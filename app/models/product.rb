# frozen_string_literal: true

class Product < ApplicationRecord
  attr_accessor :quantity_in_cart

  belongs_to :category
  has_many :order_details, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.name.length.maximum}
  validates :information, presence: true, length: {maximum: Settings.information.length.maximum}
  validates :price, :quantity, presence: true

  scope :by_active, ->{where active: true}
  scope :newest, ->{order created_at: :desc}
  scope :stocking, ->{where "quantity > ?", Settings.quantity.zero}
  scope :load_product_by_ids, ->(product_ids){where id: product_ids}
  scope :by_alphabet, ->(order){order name: order}
  scope :by_price, ->(order){order price: order}
end
