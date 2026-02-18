Armygrade.all.each do |y|
Profilepicture.find_or_create_by(title: y.nom+" "+y.appellation,image: y.read_attribute(:image))
end
