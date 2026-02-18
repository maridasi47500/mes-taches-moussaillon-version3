@song=Song.find_or_create_by(name:"voyage immobile",artists:[Artist.new])
@refrain=@song.refrains.find_or_create_by(orderid: 1)
File.readlines('./gpslucachanson.txt').each_with_index do |line,i|
@refrain.contents.create!(content: line,lineid:i)
end

