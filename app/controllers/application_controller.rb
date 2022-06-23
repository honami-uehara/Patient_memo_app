class ApplicationController < ActionController::Base
  # deviseのコントローラを使う前に呼ばれるアクション(ログイン機能について)
before_action :configure_permitted_parameters, if: :devise_controller?
#編集機能について
before_action :configure_account_update_parameters, if: :devise_controller?
# ログイン済ユーザーのみにアクセスを許可する
before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation ]
    # 新規登録時にnameの取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    # 情報更新時にnameの取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    # アカウント編集の時にnameとintroductionのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  def configure_account_update_parameters
   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password])
  end
end

