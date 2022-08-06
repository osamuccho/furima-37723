class PurchaseSending
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token #保存したいカラム名を属性値として扱えるようにする

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
    validates :prefecture_code_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :token, presence: true
  end


  def save
    purchase_history = PurchaseHistory.create!(item_id: item_id, user_id: user_id) #データをテーブルに保存する処理
    SendingDestination.create!(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,purchase_history_id: purchase_history.id) #データをテーブルに保存する処理
  end
end