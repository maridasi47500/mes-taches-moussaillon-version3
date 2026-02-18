class Composer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable#, :registerable,
         #:recoverable, :rememberable, :validatable
  def image=(file)
    if file.is_a?(String)
    self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='photos'
abs="/app/assets/images/"+namefile
p abs
    image =Post.cloud([loc,filename].join('/'),pathfile)
    if image
    self.write_attribute(:image,image)
    else
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

    end
    end
end


end
