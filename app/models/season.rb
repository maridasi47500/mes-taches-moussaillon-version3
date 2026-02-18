class Season < ApplicationRecord
def tasks
b=self.begin_at
e=self.end_at
cyear=Date.today.year
b=b.change(year: cyear)
e=e.change(year: cyear)
if e < b
e=e.change(year: (cyear+1))

end
((0..50).to_a.map{|x|Task.where(start_at: b.years_ago(x)..e.years_ago(x))}+(0..50).to_a.map{|x|Task.where(start_at: b.years_since(x)..e.years_since(x))}).flatten
end
def image=(file)
    if file.is_a?(String)
    self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

    end
end

def image
read_attribute(:image)
end

end
