@song=Song.find_by(name:"voyage immobile")
@refrain=@song.refrains.find_or_create_by(orderid: 1)
File.readlines('./parolesluca.txt').each_with_index do |line,i|
@refrain.contents.create!(content: line,lineid:i)
end

