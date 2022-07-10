class User < ApplicationRecord
  validates :name, presence: true
  validates :birthday, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :family_name
    validates :first_name
    
  end

  with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'is invalid. Input full-width katakana characters' } do
  validates :family_name_kana
    validates :first_name_kana
  end


  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "is invalid. Include both letters and numbers" }


 
 
 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
