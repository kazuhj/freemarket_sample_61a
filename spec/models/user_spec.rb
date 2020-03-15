require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nickname、email、password、family_name、first_name、family_name_kana、first_name_kana、birth_year、birth_month、birth_dayが存在すれば登録できること
    it "ニックネーム、メール、password、お名前（漢）、お名前（カナ）、生年月日が存在すれば登録できます" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "ニックネームが空だと登録出来ません" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "emailが空だと登録出来ません" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. 重複したemailが存在する場合登録できないこと
    it "重複したemail addressが存在すると登録出来ません" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 5. passwordが空では登録できないこと
    it "passwordが空だと登録出来ません" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 6. passwordが半角英数字の7文字以上であれば登録できること
    it "passwordが半角英数字の7文字以上であれば登録出来ます" do
      user = build(:user, password: "a000000")
      user.valid?
      expect(user).to be_valid
    end

    # 7. passwordが６文字以下では登録できないこと
    it "passwordが6文字以下だと登録出来ません " do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力して下さい")
    end

    # 8. passwordが7文字以上でも半角英数字以外では登録できないこと
    it "passwordが7文字以上でも半角英数字以外だと登録出来ません " do
      user = build(:user, password: "0_00000")
      user.valid?
      expect(user.errors[:password]).to include("は半角英数字で入力して下さい")
    end

    # 9. family_nameが空だと登録出来ないこと
    it "family_nameが空だと登録出来ません" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("can't be blank")
    end

    # 10. first_nameが空だと登録出来ないこと
    it "first_nameが空だと登録出来ません" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 11. family_name_kanaが空だと登録出来ないこと
    it "family_name_kanaが空だと登録出来ません" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("can't be blank")
    end

    #12. family_name_kanaはカタカナorひらがなで登録OK
    it "family_name_kanaはカタカナorひらがなで登録出来ます" do
      user = build(:user, family_name_kana: "カタかな")
      expect(user).to be_valid
    end

    #13. family_name_kanaはカタカナorひらがな以外では登録出来ないこと
    it "family_name_kanaはカタカナorひらがな以外では登録出来ません" do
      user = build(:user, family_name_kana: "katakana")
      expect(user.errors[:family_name_kana]).to include("はカタカナorひらがなで入力して下さい")
    end

    # 14. first_name_kanaが空だと登録出来ないこと
    it "first_name_kanaが空だと登録出来ません" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    #15. first_name_kanaはカタカナorひらがなで登録OK
    it "first_name_kanaはカタカナorひらがなで登録出来ます" do
      user = build(:user, first_name_kana: "カタかな")
      expect(user).to be_valid
    end

    #16. first_name_kanaはカタカナorひらがな以外では登録出来ないこと
    it "first_name_kanaはカタカナorひらがな以外では登録出来ません" do
      user = build(:user, first_name_kana: "katakana")
      expect(user.errors[:first_name_kana]).to include("はカタカナorひらがなで入力して下さい")
    end

    # 17. birth_yearが空だと登録出来ないこと
    it "birth_yearが空だと登録出来ません" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("can't be blank")
    end

    # 18. birth_monthが空だと登録出来ないこと
    it "birth_monthが空だと登録出来ません" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("can't be blank")
    end

    # 19. birth_dayが空だと登録出来ないこと
    it "birth_dayが空だと登録出来ません" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("can't be blank")
    end
  end
end


