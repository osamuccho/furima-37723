require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nameとemail、passwordとpassword_confirmationとfamily_nameとfirst_nameとfamily_name_kanaとfirst_name_kanaとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'family_nameが全角文字であれば登録できる' do
        @user.family_name = '山田'
        expect(@user).to be_valid
      end
      it 'first_nameが全角文字であれば登録できる' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'family_name_kanaが全角カナであれば登録できる' do
        @user.family_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カナであれば登録できる' do
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        user = User.new(name:nil)
        expect(user).to_not be_valid
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user).to_not be_valid 
      end
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'hogehuga.com'
        @user.valid?
        expect(@user).to_not be_valid 
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '1996o'
        @user.password_confirmation = '1996o'
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'passwordが半角英数字混合でなければ登録できない(英字のみ)' do
        @user.password = 'asdzxc'
        @user.password_confirmation = 'asdzxc'
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'passwordが半角英数字混合でなければ登録できない(数字のみ)' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'passwordが半角でなければ登録できない' do
        @user.password = 'ＡＢｃ１２３'
        @user.password_confirmation = 'ＡＢｃ１２３'
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'uepon23'
        @user.password_confirmation = 'uepon12'
        @user.valid?
        expect(@user).to_not be_valid 
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'family_nameが全角文字でなければ登録できない' do
        @user.family_name = 'huga'
        @user.valid?
        expect(@user).to_not be_valid 
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'first_nameが全角文字でなければ登録できない' do
        @user.first_name = 'huga'
        @user.valid?
        expect(@user).to_not be_valid 
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'family_name_kanaが全角カタカナでなければ登録できない' do
        @user.family_name_kana = 'あああああ'
        @user.valid?
        expect(@user).to_not be_valid 
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user).to_not be_valid 
      end
      it 'first_name_kanaが全角カタカナでなければ登録できない' do
        @user.first_name_kana = 'ｱｱｱｱｱ'
        @user.valid?
        expect(@user).to_not be_valid 
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user).to_not be_valid 
      end
    end
  end
end
