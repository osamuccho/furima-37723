class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :prefecture_code
  belongs_to :delivery_days

  validates :item_name,presence:{message: "can't be blank" }
  validates :introduction,presence:{message: "can't be blank" }
  validates :image,presence:{message: "can't be blank" }
  validates_format_of :price, with: /\A[0-9]+\z/
  validates :price,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
             presence: {message: "can't be blank" }
  validates :delivery_days_id, :item_condition_id, :postage_payer_id, :prefecture_code_id, :category_id,  numericality: { other_than: 0 , message: "can't be blank"} 

end
