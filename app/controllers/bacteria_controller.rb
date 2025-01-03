class BacteriaController < ApplicationController
  def index
    @bacteria = Bacterium.all
  end

  def show
    @bacterium = Bacterium.find(params[:id])
  end

  def new
    @bacterium = Bacterium.new
  end

  def create
    @bacterium = Bacterium.new(bacterium_params)
    if @bacterium.save
      redirect_to @bacterium
    else
      render :new
    end
  end

  def edit
    @bacterium = Bacterium.find(params[:id])
  end

  def update
    @bacterium = Bacterium.find(params[:id])
    if @bacterium.update(bacterium_params)
      redirect_to @bacterium
    else
      render :edit
    end
  end

  def destroy
    @bacterium = Bacterium.find(params[:id])
    @bacterium.destroy
    redirect_to bacteria_path
  end

  private

  def bacterium_params
    params.require(:bacterium).permit(:name, :image_path)
  end
end
