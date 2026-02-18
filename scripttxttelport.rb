file=Dir.glob('./telguyane/*')
file.each do |f|
text=File.read(f)
Post.create!(content_fr:text)
end
