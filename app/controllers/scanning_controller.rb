class ScanningController < ApplicationController
  protect_from_forgery except: :index  
  
  def index
      image_root = 'public/assets/images/'
     @dir_list = []
      Dir.foreach(image_root) {|dir|  @dir_list << dir if (dir != '.' && dir != '..')  && (dir.to_s.starts_with?(params[:barcode].to_s)) }
            
      @dir_list = ['gap_Fotor.jpg'] if @dir_list.empty?
      
      #@dir_list = @dir_list.sort
      
      @dir_list = @dir_list.sort_by! { |s| -s.length }
      
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
  
  def destroy
      image_root = 'public/assets/images/'
      @dir_list = []
      Dir.foreach(image_root) {|dir|  @dir_list << dir if (dir != '.' && dir != '..')  && (dir.to_s.starts_with?(params[:barcode].to_s)) }
      DataFile.delete_file(@dir_list)
      
      render :json => @dir_list.to_json 
  end
  
end
