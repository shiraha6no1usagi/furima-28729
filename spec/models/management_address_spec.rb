require 'rails_helper'

RSpec.describe ManagementAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      @management_address = FactoryBot.build(:management_address)
    end

    it '郵便番号が空だと登録できない' do
      @management_address.postal_code = nil
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '都道府県を選択していないと登録できない' do
      @management_address.prefecture = 0
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it '市町区村が空だと登録できない' do
      @management_address.city = nil
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと登録できない' do
      @management_address.house_number = nil
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空だと登録できない' do
      @management_address.phone_number = nil
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '郵便番号はハイフンがないと登録できない' do
      @management_address.postal_code = '1234567'
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '電話番号は12桁以上だと登録できない' do
      @management_address.phone_number = '0901234567890'
      @management_address.valid?
      expect(@management_address.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
