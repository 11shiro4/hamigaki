class KidsBacteriaController < ApplicationController
  def index
    @kids_bacteria = KidsBacterium.all
  end

  def show
    @kids_bacterium = KidsBacterium.find(params[:id])
  end

  def new
    @kids_bacterium = KidsBacterium.new
  end

  def create
    @kids_bacterium = KidsBacterium.new(kids_bacterium_params)
    if @kids_bacterium.save
      redirect_to @kids_bacterium
    else
      render :new
    end
  end

  def edit
    @kids_bacterium = KidsBacterium.find(params[:id])
  end

  def update
    @kids_bacterium = KidsBacterium.find(params[:id])
    if @kids_bacterium.update(kids_bacterium_params)
      redirect_to @kids_bacterium
    else
      render :edit
    end
  end

  def destroy
    @kids_bacterium = KidsBacterium.find(params[:id])
    @kids_bacterium.destroy
    redirect_to kids_bacteria_path
  end

  private

  def kids_bacterium_params
    params.require(:kids_bacterium).permit(:kid_nickname, :bacteria_id, :status)
  end
end
