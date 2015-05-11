class DataFile < ActiveRecord::Base
    attr_accessor :upload

    RAILS_CAR_IMAGES = 'public/assets/images/' 
    
  def self.save_file(barcode, upload)   
    

    
    file_name = upload['datafile'].original_filename  if  (upload['datafile'] !='')    
    file = upload['datafile'].read    

    file_type = file_name.split('.').last
    new_name_file = barcode.to_s + '-' + Time.now.to_i.to_s
    name_folder = new_name_file
    new_file_name_with_type = "#{new_name_file}." + file_type

    image_root = "#{RAILS_CAR_IMAGES}"
    
    #Dir.mkdir(image_root + "#{name_folder}");
      File.open(image_root + new_file_name_with_type, "wb")  do |f|  
        f.write(file) 
      end
      
      new_file_name_with_type 
  end
  
  def self.delete_file (file_list)
    image_root = "#{RAILS_CAR_IMAGES}"
    file_list.each do |file|
      File.delete(image_root + file)  
    end
    
  end
end