class Mymap < ApplicationRecord
has_many :mymapscoords
accepts_nested_attributes_for :mymapscoords, allow_destroy: true

def image
    i=read_attribute(:image)
    if i && i.include?('http')
      i
    elsif i
      "/assets/"+i
    else
      "/assets/iconhumain.png"
    end
end

end
