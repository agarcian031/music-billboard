class BillboardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @billboard = Billboard.all.order(:name)
  end

  def show
    #set_board
  end

  def new
    @billboard = Billboard.new 
  end

  def create
    @billboard = Billboard.new(board_params)

    if @billboard.save 
      redirect_to billboards_path
    else 
      render :new 
    end
  end 

  def edit
    #set_board 
  end

  def update 
    if @billboard.update(board_params)
      redirect_to billboard_path(@billboard)
    else 
      render :edit
    end 
  end 

  def destroy 
    #set_board 
    @billboard.destroy 
    redirect_to root_path 
  end 

  private 
  def set_board
    @billboard = Billboard.find(params[:id])
  end 

  def board_params
    params.require(:billboard).permit(:name)
  end 
end
