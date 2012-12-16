class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_user
  
  def index 
    @albums = @user.albums
  end

  def new
  	@album = @user.albums.new
  	@album.photos.build
  end

  def create
  	@album = @user.albums.new(params[:album])

  	respond_to do |format|
  	  if @album.save
  	    flash[:notice] = 'Album with photos is created successfully.'
  	    format.html { redirect_to user_albums_path(@user) }
  	  else
  	    flash[:alert] = "#{@album.errors.full_messages.join(', ')}"
  	    format.html { redirect_to new_user_album_path(@user) }
  	  end	
    end 
  end

private
  def get_user
    @user = User.find_by_id(params[:user_id])
  end 

end
