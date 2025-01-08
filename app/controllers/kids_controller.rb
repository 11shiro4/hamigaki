class KidsController < ApplicationController
  def index
    if kid_signed_in?
      @kids = Kid.where.not(id: current_kid.id)
    else
      @kids = Kid.all
    end
  end

  def show
    if params[:signout] == "true"
      reset_session
      redirect_to root_path
    else
      @kid = Kid.find(params[:id])
    end
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
    @kid = Kid.find(params[:id])
  end

  def update
    @kid = Kid.find(params[:id])
    if @kid.update(kid_params)
      redirect_to @kid
    else
      render :edit
    end
  end

  def destroy
    @kid = Kid.find(params[:id])
    @kid.destroy
    redirect_to kids_path
  end

  private

  def kid_params
    params.require(:kid).permit(:email, :password, :password_confirmation, :nickname, :age)
  end
end
