class Barcriterion < ApplicationRecord
self.table_name = "barcriteria"
belongs_to :bar
belongs_to :gooduser, class_name: 'User'
  def self.findbyid(n)
    where('id' => n)
  end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n1=I18n.transliterate(n1)
    where('lower(description) like ?',n1).select('barcriteria.*, barcriteria.description as name')
    else
    []
    end
  end

end
