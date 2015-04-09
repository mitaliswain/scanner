class ScanningController < ApplicationController
  def index
    
  end
  
  def create
  image_root = 'public/assets/images/'
  image = DataFile.save_file(params[:upload])
    #redirect_to images_path(:car_id => params[:car_id])
    #render json: 'ok'
  @dir_list = []
      Dir.foreach(image_root) {|dir|  @dir_list << dir if dir != '.' and dir != '..'}
  end
  
end
