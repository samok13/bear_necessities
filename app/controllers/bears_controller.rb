class BearsController < ApplicationController

  def new
    @bear = Bear.new
  end

  def create
    @bear = Bear.new(bear_params)

    if @bear.save
      flash[:notice] = "Bear successfully created."
      redirect_to @bear
    else
      render :new
    end

  end

  def show
    @bear = Bear.find(params[:id])
  end

  def index
    @bears = Bear.all
  end

  def edit
    @bear =  Bear.find(params[:id])
  end

  def update
    @bear = Bear.find(params[:id])

    if @bear.update(bear_params)
      flash[:notice] = "Bear successfully updated."
      redirect_to @bear
    else
      render :edit
    end

  end

  def destroy
    @bear =  Bear.find(params[:id])
    @bear.destroy

    if @bear.destroy
      flash[:notice] = "Your bear has been deleted."
      redirect_to bears_path
    else
      flash[:alert] = "Bear deletion failed."
      redirect_to :back
    end
  end

  private

  def bear_params
    params.require(:bear).permit(:name, :description)
  end


end
