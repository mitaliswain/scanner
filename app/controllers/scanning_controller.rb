class ScanningController < ApplicationController
  protect_from_forgery except: :index  
  
  def index
      image_root = 'public/assets/images/'
      p params[:barcode]
     @dir_list = []
      Dir.foreach(image_root) {|dir|  @dir_list << dir if (dir != '.' && dir != '..')  && (dir[0..4] == params[:barcode]) }
      
    respond_to do |format|
      format.html 
      format.json { render :json => @dir_list.to_json }
    end
  end
  
  def create
  image_root = 'public/assets/images/'
  image = DataFile.save_file(params[:barcode], params[:upload])
    #redirect_to images_path(:car_id => params[:car_id])
    #render json: 'ok'
    
  @dir_list = []
      Dir.foreach(image_root) {|dir|  @dir_list << dir if dir != '.' and dir != '..'}
  end
  
  def capture
    
  end
  
end
