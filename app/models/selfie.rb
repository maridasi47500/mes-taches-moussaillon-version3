class Selfie < ApplicationRecord
has_many :selfiehavesailors

has_many :selfiehaveposts
 accepts_nested_attributes_for :selfiehavesailors

 has_many :sailors, through: :selfiehavesailors, source: :person
def myname
name && name.length > 0 ? name : nil
end
def erreursailors
selfiehavesailors.any? {|x|x.errors.to_a.length > 0} || selfiehavesailors.length > 0
end
def name
      self.read_attribute(:name)
end
    def name=(file)
      if !file.is_a?(String)
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      if filename.length > 0
      self.write_attribute(:name, filename)
      end
      loc='photos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
      `mv #{pathfile} #{abs}`
      #Post.cloud([loc,filename].join('/'),abs)
      elsif file.is_a?(String) && file.length > 0
      self.write_attribute(:name, file)

       end

    end


end
