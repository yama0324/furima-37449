require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do 
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do 
        @user.password = ''  
        @user.valid?
       expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'first_nameが空では登録できない' do 
        @user.first_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_nameが空では登録できない' do 
        @user.last_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do 
        @user.first_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do 
        @user.last_name_kana = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do 
        @user.birthday = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emaiは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英数混合出ないと登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'first_nameが漢字・カタカナ・ひらがな以外は登録できない' do 
        @user.first_name = 'yamamori'  
        @user.valid?
        expect(@user.errors.full_messages).to include ('First name is invalid')
      end
      it 'last_nameが漢字・カタカナ・ひらがな以外は登録できない' do 
        @user.last_name = 'junya'  
        @user.valid?
        expect(@user.errors.full_messages).to include ('Last name is invalid')
      end
      it 'first_name_kanaが全角カタカナ以外は登録できない' do 
        @user.first_name_kana = 'やまもり'  
        @user.valid?
        expect(@user.errors.full_messages).to include ('First name kana is invalid')
      end
      it 'last_name_kanaが全角カタカナ以外は登録できない' do 
        @user.last_name_kana = 'じゅんや'  
        @user.valid?
        expect(@user.errors.full_messages).to include ('Last name kana is invalid')
      end
    end
  end
end
