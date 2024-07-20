class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.order('id DESC')
    render 'welcome'
  end

  # GET /users/1 or /users/1.json
  def show
    # @user は before_action :set_user で設定済み
  end

  # GET /users/new
  def new
    @article = Article.new
    user = current_user
    @articles = user.articles.order(id: :desc)
  end

  # GET /users/1/edit
  def edit
    # @user は before_action :set_user で設定済み
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if User.exists?(email: @user.email)
      flash[:error] = I18n.t('users.email_already_registered')
      render 'new'
    elsif @user.save
      redirect_to root_path, notice: I18n.t('users.user_created_successfully')
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    # @user は before_action :set_user で設定済み
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if params[:id] == 'sign_out'
      sign_out current_user  # ログアウト処理を行う
      redirect_to root_path  # ルートにリダイレクトする例
    else
      @user = User.find(params[:id])
    end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
