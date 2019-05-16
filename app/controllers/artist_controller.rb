class ArtistController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artist = Artist.all
  end

  def show
    #set_artist
  end

  def new
    @artist = Artist.new 
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save 
      redirect_to artists_path
    else 
      render :new
    end 
  end 

  def edit
    #set_artist
  end

  def update 
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else 
      render :edit 
    end
  end 

  def destroy 
    #set_board 
    @artist.destroy 
    redirect_to artists_path 
  end 

  private 
  def set_artist
    @artist = Artist.find(params[:id])
  end 

  def artist_params
    params.require(:artist).permit(:name)
  end 
end
