require 'rails_helper'

describe Users::RegistrationsController, type: :controller  do

  describe 'GET #new' do
    it "renders the :new template" do
      request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
      expect(response).to render_template :new
    end

    #200レスポンスは成功というステート
    it "200レスポンスを返すこと" do
      request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
      expect(response).to have_http_status "200"
    end

    describe "#create" do
      context "有効なデータの場合" do 
        # 同じ処理はsubjectを使うことでｄｒｙにし同じデータを使っているとわかりやすくする
        subject {
          user_params = attributes_for(:user)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create, params: { user: user_params},
                          session: {
                            nickname: "watashi",
                            email: "kkk@gmail.com",
                            password: "a234567",
                            password_confirmation: "a234567",
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            birthday_year: "1990",
                            birthday_month: "4",
                            birthday_day: "11"
                          }
        }
        # 200レスポンスはリダイレクト成功というステート
        it "200レスポオンスを返すこと" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          #設定したsubjectはこのように使う
          subject
          expect(response).to have_http_status "200"
        end
      
        it "電話番号確認ページにrenderすること" do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to render_template :new_telephone
        end
      end

      context "無効なデータの場合" do
        subject {
          #無効なデータのときは処理の流れを理解しているとスムーズに進む
          user_params = attributes_for(:user, nickname: "")
          post :create, params: { user: user_params},
                                session: {
                                  nickname: "watashi",
                                  email: "kkk@gmail.com",
                                  password: "a234567",
                                  password_confirmation: "a234567",
                                  family_name: "myouji",
                                  first_name: "name",
                                  family_name_kana: "ミョウジ",
                                  first_name_kana: "ナマエ",
                                  birthday_year: "1990",
                                  birthday_month: "4",
                                  birthday_day: "11"
                                }
        }
  
        it "200レスポオンスを返すこと" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to have_http_status "200"
        end
  
        it "newページにrenderにすること" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to render_template :new
        end
      end
    end

    describe "#create_telephone" do
      context "有効なデータの場合" do
        subject {
          user_params = attributes_for(:user)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create, params: { user: user_params},
                          session: {
                            nickname: "watashi",
                            email: "kkk@gmail.com",
                            password: "a234567",
                            password_confirmation: "a234567",
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            birthday_year: "1990",
                            birthday_month: "4",
                            birthday_day: "11"
                          }
          telephone_params = attributes_for(:telephone)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create_telephone, params: { telephone: telephone_params},
                          session: {
                            id: 1,
                            tel: "00000000000",
                            user_id: "1"
                          }
          
        }
        # 200レスポンスはリダイレクト成功というステート
        it "200レスポオンスを返すこと" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          #設定したsubjectはこのように使う
          subject
          expect(response).to have_http_status "200"
        end
      
        it "住所登録ページにrenderすること" do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to render_template :new_address
        end
      end

      context "無効なデータの場合" do
        subject {
          #無効なデータのときは処理の流れを理解しているとスムーズに進む
          user_params = attributes_for(:user)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create, params: { user: user_params},
                          session: {
                            nickname: "watashi",
                            email: "kkk@gmail.com",
                            password: "a234567",
                            password_confirmation: "a234567",
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            birthday_year: "1990",
                            birthday_month: "4",
                            birthday_day: "11"
                          }
          telephone_params = attributes_for(:telephone, tel: "")
          post :create_telephone, params: { telephone: telephone_params},
                                session: {
                                  id: 1,
                                  tel: "00000000000",
                                  user_id: "1"
                                }
        }
  
        it "200レスポオンスを返すこと" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to have_http_status "200"
        end
  
        it "new_telephoneにrenderすること" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to render_template :new_telephone
        end
      end
    end

    describe "#create_address" do
      context "有効なデータの場合" do
        subject {
          user_params = attributes_for(:user)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create, params: { user: user_params},
                          session: {
                            nickname: "watashi",
                            email: "kkk@gmail.com",
                            password: "a234567",
                            password_confirmation: "a234567",
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            birthday_year: "1990",
                            birthday_month: "4",
                            birthday_day: "11"
                          }
          telephone_params = attributes_for(:telephone)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create_telephone, params: { telephone: telephone_params},
                          session: {
                            id: 1,
                            tel: "00000000000",
                            user_id: "1"
                          }
          address_params = attributes_for(:address)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create_address, params: { address: address_params},
                          session: {
                            id: 1,
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            zip_code: "0000000",
                            prefecture: "北海道",
                            city: "市区町村",
                            address: "番地",
                            user_id: "1"
                          }
          
        }
        # 200レスポンスはリダイレクト成功というステート
        it "200レスポオンスを返すこと" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          #設定したsubjectはこのように使う
          subject
          expect(response).to have_http_status "200"
        end
      
        it "cardページにrenderすること" do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to render_template :new_card
        end
      end

      context "無効なデータの場合" do
        subject {
          #無効なデータのときは処理の流れを理解しているとスムーズに進む
          user_params = attributes_for(:user)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create, params: { user: user_params},
                          session: {
                            nickname: "watashi",
                            email: "kkk@gmail.com",
                            password: "a234567",
                            password_confirmation: "a234567",
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            birthday_year: "1990",
                            birthday_month: "4",
                            birthday_day: "11"
                          }
          telephone_params = attributes_for(:telephone)
          post :create_telephone, params: { telephone: telephone_params},
                                session: {
                                  id: 1,
                                  tel: "00000000000",
                                  user_id: "1"
                                }
          address_params = attributes_for(:address, zip_code: "")
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create_address, params: { address: address_params},
                          session: {
                            id: 1,
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            zip_code: "0000000",
                            prefecture: "北海道",
                            city: "市区町村",
                            address: "番地",
                            user_id: "1"
                          }
        }
  
        it "200レスポオンスを返すこと" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to have_http_status "200"
        end
  
        it "new_addressにrenderすること" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          subject
          expect(response).to render_template :new_address
        end
      end  
    end
    describe "#create_card" do
      context "有効なデータの場合" do
        subject {
          user_params = attributes_for(:user)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create, params: { user: user_params},
                          session: {
                            nickname: "watashi",
                            email: "kkk@gmail.com",
                            password: "a234567",
                            password_confirmation: "a234567",
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            birthday_year: "1990",
                            birthday_month: "4",
                            birthday_day: "11"
                          }
          telephone_params = attributes_for(:telephone)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create_telephone, params: { telephone: telephone_params},
                          session: {
                            id: 1,
                            tel: "00000000000",
                            user_id: "1"
                          }
          address_params = attributes_for(:address)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create_address, params: { address: address_params},
                          session: {
                            id: 1,
                            family_name: "myouji",
                            first_name: "name",
                            family_name_kana: "ミョウジ",
                            first_name_kana: "ナマエ",
                            zip_code: "0000000",
                            prefecture: "北海道",
                            city: "市区町村",
                            address: "番地",
                            user_id: "1"
                          }
          card_params = attributes_for(:card)
          #post :アクション名, params: { パラメータ名: "値"}, session: { session名: "値" } でデータを指定できる
          post :create_card, params: { card: card_params},
                          session: {
                            id: 1,
                            customer_number: "0000",
                            year: "21",
                            month: "1",
                            security_code: "0000",
                            user_id: "1"
                          }
        }
        # 200レスポンスはリダイレクト成功というステート
        it "200レスポオンスを返すこと" do
          request.env["devise.mapping"] = Devise.mappings[:user]
          #設定したsubjectはこのように使う
          subject
          expect(response).to have_http_status "200"
        end
      end
      context 'card is valid' do
        before do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          @user = attributes_for(:user)
          session["devise.regist_data"] = {user: @user}
          # binding.pry
          @telephone = attributes_for(:telephone)
          @address = attributes_for(:address)
          @card = attributes_for(:card)
        end
  
        subject {
          post :create_card, params: {card: @card },
          session: {
            # user: @user,
            "devise.regist_data": {user: @user},
            telephone: @telephone,
            address: @address
          }
        }
  
        it 'リクエストは200となること' do
          # post :create_card, params: {card: @card}
          subject
          expect(response.status).to eq 200
        end
  
        it 'データベースに新しいユーザーが登録されること' do
          expect do
            subject
          end.to change{User.count}.by(1)
        end
      end
    end
  end
end