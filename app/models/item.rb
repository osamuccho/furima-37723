class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_one :purchase_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :prefecture_code
  belongs_to :delivery_days

  validates :item_name, presence: true
  validates :introduction, presence: true
  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }

  validates_format_of :price, with: /\A[0-9]+\z/
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    presence: true
  validates :delivery_days_id, :item_condition_id, :postage_payer_id, :prefecture_code_id, :category_id,
            numericality: { other_than: 1, message: "を入力してください" }
end
