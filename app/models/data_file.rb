class DataFile < ActiveRecord::Base
    attr_accessor :upload

    RAILS_CAR_IMAGES = 'public/assets/images/' 
    
  def self.save_file(upload)   
    

    
    file_name = upload['datafile'].original_filename  if  (upload['datafile'] !='')    
    file = upload['datafile'].read    

    file_type = file_name.split('.').last
    new_name_file = Time.now.to_i
    name_folder = new_name_file
    new_file_name_with_type = "#{new_name_file}." + file_type

    image_root = "#{RAILS_CAR_IMAGES}"
    
    Dir.mkdir(image_root + "#{name_folder}");
      p image_root + "#{name_folder}/" + new_file_name_with_type
      File.open(image_root + "#{name_folder}/" + new_file_name_with_type, "wb")  do |f|  
        f.write(file) 
      end
      new_name_file.to_s + '/' + new_file_name_with_type 
  end
end