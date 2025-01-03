class KidsController < ApplicationController
  def index
    @kids = Kid.all
  end

  def show
    @kid = Kid.find(params[:id])
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
    params.require(:kid).permit(:nickname, :age)
  end
end
