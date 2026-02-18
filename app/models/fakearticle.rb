class Fakearticle < ApplicationRecord
def authorpic=(file)
    if file.is_a?(String)
    self.write_attribute(:authorpic,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:authorpic,file.original_filename)

    end
end
def authorpic
    i=read_attribute(:authorpic)
    if i && i.include?('http')
      i
    elsif i
      "/assets/"+i
    else
      ""
    end
end
def pic=(file)
    if file.is_a?(String)
    self.write_attribute(:pic,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:pic,file.original_filename)

    end
end
def pic
    i=read_attribute(:pic)
    if i && i.include?('http')
      i
    elsif i
      "/assets/"+i
    else
      ""
    end
end
end
