class ScanningController < ApplicationController
  def index
    
  end
  
  def create
  @image = DataFile.save_file(params[:upload])
    #redirect_to images_path(:car_id => params[:car_id])
    #render json: 'ok'  
  end
  
end
