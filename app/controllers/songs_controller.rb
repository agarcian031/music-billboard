class SongsController < ApplicationController
  # before_action :set_board
  before_action :set_artist 
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = Songs.all
  end

  def show
    #render :show 
  end

  def new
    @song = Song.new 
    # render :new
  end

  def create 
    @song = Song.new(song_params)
    if @song.save
      redirect_to artist_song_path(@artist.id, @song.id)
    else 
      render :new 
    end 
  end 

  def edit
    #set_song 
  end

  def update 
    if @song.update(song_params)
      redirect_to artist_song_path(@artist.id, @song.id)
    else 
      render :edit 
    end 
  end 

  def destroy 
    @song.destroy 
    redirect_to artist_songs_path(@artist.id)
  end 

  private 
  # def set_board
  #   @billboard = Billboard.find(params[:billboard_id])
  # end  

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end 

  def set_song
    @song = Song.find(params[:id])
  end 

  def song_params
    params.require(:song).permit(:name)
  end 
end
