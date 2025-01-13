class KidsController < ApplicationController
  before_action :set_kid, only: [ :show, :edit, :update, :destroy ]

  def index
    if kid_signed_in?
      @kids = Kid.where.not(id: current_kid.id)
    else
      @kids = Kid.all
    end
  end

  def show
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = Kid.new(kid_params)
    if @kid.save
      redirect_to @kid
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @kid.update(kid_params)
      redirect_to @kid
    else
      render :edit
    end
  end

  def destroy
    @kid.destroy
    redirect_to kids_path
  end

  private

  def kid_params
    params.require(:kid).permit(:email, :password, :password_confirmation, :nickname, :age)
  end

  def set_kid
    @kid = Kid.find_by(id: params[:id])
    if @kid.nil?
      flash[:alert] = "その子供は見つかりません。"
      redirect_to root_path and return
    end
  end
end
