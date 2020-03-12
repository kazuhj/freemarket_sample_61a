# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # 「super」は「@user = User.new」と記述したのと同じ
  def new
    super
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params) # 1ページ目から送られてきたパラメータをインスタンス変数@userに代入
    unless @user.valid? # 「valid?」は、送られてきたパラメータが指定されたバリデーションに違反しないかチェック
      flash.now[:alert] = @user.errors.full_messages # falseになったらエラーメッセージと共に、newアクションへrenderする
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes} # バリデーションチェックが完了したら「session["devise.regist_data"」へ値を代入する
    session["devise.regist_data"][:user]["password"] = params[:user][:password] # attributesメソッドでデータ整形した際にパスワードの情報は含まれていない為、パスワードを再度代入
    @telephone = @user.build_telephone # 「build_telephone」で今回生成したインスタンスに紐付くtelephoneモデルのインスタンスを生成、@telephoneに代入
    render :new_telephone # 電話番号を登録させるページを表示するnew_telephoneアクションのビューへrenderする
  end

  def create_telephone
    # createアクションと同様に「valid?」メソッドでバリデーションチェックを行う
    @user = User.new(session["devise.regist_data"]["user"])
    @telephone = Telephone.new(telephone_params)
    unless @telephone.valid?
      flash.now[:alert] = @telephone.errors.full_messages
      render :new_telephone and return
    end
    @user.build_telephone(@telephone.attributes)
    session["telephone"] = @telephone.attributes
    @address = @user.build_address
    render :new_address
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  protected

  def telephone_params
    params.require(:telephone).permit(:tele)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
