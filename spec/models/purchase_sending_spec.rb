require 'rails_helper'

RSpec.describe PurchaseSending, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_sending = FactoryBot.build(:purchase_sending, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_sending).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_sending.building_name = ''
        expect(@purchase_sending).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @purchase_sending.token = nil
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと保存できないこと' do
        @purchase_sending.post_code = ''
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_sending.post_code = '1234567'
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_sending.prefecture_code_id = 1
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include("Prefecture code can't be blank")
      end
      it 'cityは空だと保存できないこと' do
        @purchase_sending.city = ''
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberは空だと保存できないこと' do
        @purchase_sending.house_number = ''
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberは空だと保存できないこと' do
        @purchase_sending.phone_number = ''
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_sending.phone_number = '２０００７８７７８７８'
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_sending.user_id = nil
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_sending.item_id = nil
        @purchase_sending.valid?
        expect(@purchase_sending.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
