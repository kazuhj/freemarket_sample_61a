require 'rails_helper'

# user_idはsessionを利用しウィザード形式で新規登録機能を実装した際に「optional: true」で外部キーがnullであることを許可している為記述なしです

describe Telephone do
  describe '#create' do
    # 1. tel、user_idが存在すれば登録できること
    it "tel、user_idが存在すれば登録できます" do
      telephone = build(:telephone)
      expect(telephone).to be_valid
    end

    # 2. telが空では登録できないこと
    it "telが空だと登録出来ません" do
      telephone = build(:telephone, tel: nil)
      telephone.valid?
      expect(telephone.errors[:tel]).to include("を入力してください", "は不正な値です")
    end

    # 3. telが半角数字の11桁だと登録できること
    it "telが半角数字の11桁だと登録出来ます" do
      telephone = build(:telephone, tel: "00000000000")
      telephone.valid?
      expect(telephone).to be_valid
    end

    # 4. telが9桁以下では登録できないこと
    it "telが9桁以下だと登録出来ません " do
      telephone = build(:telephone, tel: "000000000")
      telephone.valid?
      expect(telephone.errors[:tel]).to include("は不正な値です")
    end

    # 5. telが12桁以上では登録できないこと
    it "telが12桁以上だと登録出来ません " do
      telephone = build(:telephone, tel: "000000000000")
      telephone.valid?
      expect(telephone.errors[:tel]).to include("は不正な値です")
    end
  end
end
