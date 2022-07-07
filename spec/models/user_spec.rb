require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      user = User.new(name: '', email: 'test@example', password: '000000', password_confirmation: '000000',family_name: 'a',first_name: 'a',family_name_kana: 'a',first_name_kana: 'a',birthday: '1996-02-27')
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(name: 'test', email: '', password: '000000', password_confirmation: '000000',family_name: 'a',first_name: 'a',family_name_kana: 'a',first_name_kana: 'a',birthday: '1996-02-27')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'family_nameが空では登録できない' do
      user = User.new(name: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',family_name: '',first_name: 'あ',family_name_kana: 'ア',first_name_kana: 'ア',birthday: '1996-02-27')
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(name: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',family_name: 'test',first_name: '',family_name_kana: 'test',first_name_kana: 'test',birthday: '1996-02-27')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_name_kanaが空では登録できない' do
      user = User.new(name: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',family_name: 'test',first_name: 'test',family_name_kana: '',first_name_kana: 'test',birthday: '1996-02-27')
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(name: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',family_name: 'test',first_name: 'test',family_name_kana: 'test',first_name_kana: '',birthday: '1996-02-27')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = User.new(name: 'test', email: 'test@example', password: '000000', password_confirmation: '000000',family_name: 'test',first_name: 'test',family_name_kana: 'test',first_name_kana: 'test',birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
