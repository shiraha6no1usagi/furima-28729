require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない場合登録できない' do
        @user.email = 'kkkgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合出ないと登録出来ない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは確認用含めて2回入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字と名前がそれぞれないと登録出来ない' do
        @user.family_name = '山田'
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'ユーザー本名は全角(漢字・ひらがな・カタカナ)でないと登録出来ない' do
        @user.family_name = 'yamada'
        @user.name = 'rikutarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid. Input full-width characters.', 'Family name is invalid. Input full-width characters.')
      end
      it 'ユーザー本名のフリガナの名字と名前がそれぞれないと登録出来ない' do
        @user.family_name_read = 'ヤマダ'
        @user.name_read = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name read can't be blank")
      end
      it 'ユーザー本名のフリガナは全角(カタカナ)でないと登録出来ない' do
        @user.family_name_read = 'yamada'
        @user.name_read = 'rikutarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name read is invalid. Input full-width katakana characters.', 'Family name read is invalid. Input full-width katakana characters.')
      end
      it '生年月日がないと登録出来ない' do
        @user.date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date can't be blank")
      end
    end
  end
end
