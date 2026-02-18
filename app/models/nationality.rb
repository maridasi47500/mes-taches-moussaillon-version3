class Nationality < ApplicationRecord
translates :name
has_many :people
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end

def self.findbyid(i)
where(id: i)
end

    def flagicon=(file)
      if !file.is_a?(String)
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      if filename.length > 0
      self.write_attribute(:flagicon, filename)
      end
      loc='photos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
      `mv #{pathfile} #{abs}`
      #Post.cloud([loc,filename].join('/'),abs)
      else
      self.write_attribute(:flagicon, file)

       end

    end

end
