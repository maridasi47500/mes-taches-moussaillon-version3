require "open-uri"
require 'openssl'
require 'nokogiri'
#open("https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-0/p130x130/18011090_862654447206968_41907870697819763_n.jpg") {|f|
#   File.open("whatever_file.jpg","wb") do |file|
#     file.write f.read
#   end
#}


require "open-uri"

open("https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-0/p130x130/18011090_862654447206968_419807870697819763_n.jpg?_nc_cat=100&ccb=2&_nc_sid=7aed08&_nc_ohc=UfuNs8zKyUkAX-G42lx&_nc_ht=scontent-cdg2-1.xx&tp=6&oh=b47f37807f4060a252740b271175e236&oe=5FC0B53B") do |image|
  File.open("./test.jpg", "wb") do |file|
    file.write(image.read)
  end
end

