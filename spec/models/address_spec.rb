require 'rails_helper'

# user_idはsessionを利用しウィザード形式で新規登録機能を実装した際に「optional: true」で外部キーがnullであることを許可している為記述なしです

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
      expect(address.errors[:family_name]).to include("を入力してください")
    end

    # 3. first_nameが空だと登録出来ないこと
    it "first_nameが空だと登録出来ません" do
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    # 4. family_name_kanaが空だと登録出来ないこと
    it "family_name_kanaが空だと登録出来ません" do
      address = build(:address, family_name_kana: nil)
      address.valid?
      expect(address.errors[:family_name_kana]).to include("を入力してください")
    end

    #5. family_name_kanaはカタカナorひらがなで登録OK
    it "family_name_kanaはカタカナorひらがなで登録出来ます" do
      address = build(:address, family_name_kana: "カタかな")
      expect(address).to be_valid
    end

    #6. family_name_kanaはカタカナorひらがな以外では登録出来ないこと
    it "family_name_kanaはカタカナorひらがな以外では登録出来ません " do
      address = build(:address, family_name_kana: "katakana")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("は不正な値です")
    end

    # 7. first_name_kanaが空だと登録出来ないこと
    it "first_name_kanaが空だと登録出来ません" do
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください", "は不正な値です")
    end

    #8. first_name_kanaはカタカナorひらがなで登録OK
    it "first_name_kanaはカタカナorひらがなで登録出来ます" do
      address = build(:address, first_name_kana: "カタかな")
      expect(address).to be_valid
    end

    # 9. first_name_kanaがカタカナorひらがな以外では登録できないこと
    it "first_name_kanaはカタカナorひらがな以外では登録出来ません " do
      address = build(:address, first_name_kana: "katakana")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("は不正な値です")
    end

    # 10. zip_codeが空では登録できないこと
    it "zip_codeが空だと登録出来ません" do
      address = build(:address, zip_code: nil)
      address.valid?
      expect(address.errors[:zip_code]).to include("を入力してください", "は不正な値です")
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
      expect(address.errors[:zip_code]).to include("は不正な値です")
    end

    # 13. zip_codeが8桁以上では登録できないこと
    it "zip_codeが8桁以上だと登録出来ません " do
      address = build(:address, zip_code: "00000000")
      address.valid?
      expect(address.errors[:zip_code]).to include("は不正な値です")
    end

    # 14. zip_codeが7桁でも半角数字以外では登録できないこと
    it "zip_codeが7桁でも半角数字以外だと登録出来ません " do
      address = build(:address, zip_code: "a_00000")
      address.valid?
      expect(address.errors[:zip_code]).to include("は不正な値です")
    end

    # 15. prefectureが空では登録できないこと
    it "prefectureが空だと登録出来ません" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    # 16. cityが空では登録できないこと
    it "cityが空だと登録出来ません" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    # 17. addressが空では登録できないこと
    it "addressが空だと登録出来ません" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end
  end
end
