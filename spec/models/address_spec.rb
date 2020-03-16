require 'rails_helper'

describe Address do
  describe '#create' do
    # 1. family_name、first_name、family_name_kana、first_name_kana、zip_code、prefecture、city、addressが存在すれば登録できること
    it "family_name、first_name、family_name_kana、first_name_kana、zip_code、prefecture、city、addressが存在すれば登録できます" do
      address = build(:address)
      expect(address).to be_valid
    end

    # 2. family_nameが空だと登録出来ないこと
    it "family_nameが空だと登録出来ません" do
      address = build(:address, family_name: nil)
      address.valid?
      expect(address.errors[:family_name]).to include("can't be blank")
    end

    # 3. first_nameが空だと登録出来ないこと
    it "first_nameが空だと登録出来ません" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("can't be blank")
    end

    # 4. family_name_kanaが空だと登録出来ないこと
    it "family_name_kanaが空だと登録出来ません" do
      address = build(:address, family_name_kana: nil)
      address.valid?
      expect(address.errors[:family_name_kana]).to include("can't be blank")
    end

    #5. family_name_kanaはカタカナorひらがなで登録OK
    it "family_name_kanaはカタカナorひらがなで登録出来ます" do
      address = build(:address, family_name_kana: "カタかな")
      expect(address).to be_valid
    end

    #6. family_name_kanaはカタカナorひらがな以外では登録出来ないこと
    it "family_name_kanaはカタカナorひらがな以外では登録出来ません" do
      address = build(:address, family_name_kana: "katakana")
      expect(address.errors[:family_name_kana]).to include("はカタカナorひらがなで入力して下さい")
    end

    # 7. first_name_kanaが空だと登録出来ないこと
    it "first_name_kanaが空だと登録出来ません" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("can't be blank")
    end

    #8. first_name_kanaはカタカナorひらがなで登録OK
    it "first_name_kanaはカタカナorひらがなで登録出来ます" do
      address = build(:address, first_name_kana: "カタかな")
      expect(address).to be_valid
    end

    #9. first_name_kanaはカタカナorひらがな以外では登録出来ないこと
    it "first_name_kanaはカタカナorひらがな以外では登録出来ません" do
      address = build(:address, first_name_kana: "katakana")
      expect(address.errors[:first_name_kana]).to include("はカタカナorひらがなで入力して下さい")
    end

    # 10. zip_codeが空では登録できないこと
    it "zip_codeが空だと登録出来ません" do
      address = build(:address, zip_code: nil)
      address.valid?
      expect(address.errors[:zip_code]).to include("can't be blank")
    end

    # 11. zip_codeが半角数字の7桁だと登録できること
    it "zip_codeが半角数字の7桁だと登録出来ます" do
      address = build(:address, zip_code: "0000000")
      address.valid?
      expect(address).to be_valid
    end

    # 12. zip_codeが6桁以下では登録できないこと
    it "zip_codeが6桁以下だと登録出来ません " do
      address = build(:address, zip_code: "000000")
      address.valid?
      expect(address.errors[:zip_code]).to include("は7桁で入力して下さい")
    end

    # 13. zip_codeが8桁以上では登録できないこと
    it "zip_codeが8桁以上だと登録出来ません " do
      address = build(:address, zip_code: "00000000")
      address.valid?
      expect(address.errors[:zip_code]).to include("は7桁で入力して下さい")
    end

    # 14. zip_codeが7桁でも半角数字以外では登録できないこと
    it "zip_codeが7桁でも半角数字以外だと登録出来ません " do
      address = build(:address, zip_code: "a_00000")
      address.valid?
      expect(address.errors[:zip_code]).to include("は半角数字で入力して下さい")
    end

    # 15. prefectureが空では登録できないこと
    it "prefectureが空だと登録出来ません" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("can't be blank")
    end

    # 16. cityが空では登録できないこと
    it "cityが空だと登録出来ません" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("can't be blank")
    end

    # 17. addressが空では登録できないこと
    it "addressが空だと登録出来ません" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("can't be blank")
    end

    # 18. user_idが空では登録できないこと
    it "user_idが空だと登録出来ません" do
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user_id]).to include("can't be blank")
    end
  end
end
