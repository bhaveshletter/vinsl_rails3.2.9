class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_user
  
  def index 
    @albums = @user.albums.paginate(:page => params[:page], :per_page => 2)
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

  def destroy
    @album = @user.albums.find(params[:id])    
    if @album.destroy
      flash.now[:notice] = 'Album has been deleted successfully!'
    else
      flash.now[:error] = 'Sorry! Album has been not deleted!'      
    end  
    respond_to do |format|
      format.js
    end  
  end

private
  def get_user
    @user = User.find_by_id(params[:user_id])
  end 

end
