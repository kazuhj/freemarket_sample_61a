# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # 呼びたい処理「authorization」は「private」の下へ記述してある。
    authorization
  end

  def google_oauth2
    # 呼びたい処理「authorization」は「private」の下へ記述してある。
    authorization
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization
    # ↓ api側から受け取ったレスポンスが、変数「request.env["omniauth.auth"]」に入っている。
    # ↓ DB操作を行うメソッド「User.from_omniauth」を仮で作り、上記変数を渡している。
    # ↓ userモデルのインスタンスを返させて@userへ代入することで、その後の処理でdeviseのヘルパーを利用することができる。
    @user = User.from_omniauth(request.env["omniauth.auth"])

    # ↓ユーザー情報が登録済みなら「新規登録」ではなく「ログイン処理」を行う
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else 
      # ↓ユーザー情報が未登録なら新規登録画面へ遷移する ※@userという変数をそのまま新規登録のviewで利用する為に「render」を使用する。
      render template: 'devise/registrations/new'
    end
  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
