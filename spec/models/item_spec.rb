require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
    @item = FactoryBot.build(:item)
 end

describe '商品出品' do


  context '商品出品できるとき' do
    it 'item_name、introduction、price、delivery_days_id、item_condition_id、postage_payer_id、prefecture_code_id、category_idが存在すれば登録できる' do
      expect(@item).to be_valid
    end

  it "item_nameが40文字でも登録できること" do
    @item.item_name = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    expect(@item).to be_valid
  end

  it "introductionが1000文字でも登録できること" do
    @item.introduction =  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    expect(@item).to be_valid
  end

  it "priceが300ちょうどだと登録できる" do
    @item.price = "300"
    expect(@item).to be_valid
  end

  it "priceが9999999だと登録できる" do
    @item.price = "9999999"
    expect(@item).to be_valid
  end
end

 




  context '商品出品できないとき' do


  
   it "item_nameがない場合は登録できないこと" do
     @item.item_name = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Item name can't be blank")
   end

  
   it "introductionがない場合は登録できないこと" do
    @item.introduction = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Introduction can't be blank")
   end

   
   it "category_idがない場合は登録できないこと" do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
   end

   
   it "postage_payer_idがない場合は登録できないこと" do
    @item.postage_payer_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Postage payer can't be blank")
   end

   
   it "prefecture_code_idがない場合は登録できないこと" do
    @item.prefecture_code_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture code can't be blank")
   end

   
   it "delivery_days_idがない場合は登録できないこと" do
    @item.delivery_days_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery days can't be blank")
   end

   
   it "priceがない場合は登録できないこと" do
     @item.price = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Price can't be blank")
   end


   it "priceが299以下だと登録できないこと" do
    @item.price = '298'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
   end

   it "priceが10000000だと登録できないこと" do
    @item.price = '10000000'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
   end

  end
end
 
end
