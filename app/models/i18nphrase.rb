class I18nphrase < Phrase
has_and_belongs_to_many :otheri18nphrases, :join_table => :i18nphraseshaveotheri18nphrases, class_name: 'I18nphrase'
has_and_belongs_to_many :aliases, :join_table => :i18nphraseshavealiases
has_and_belongs_to_many :cities, :join_table => :i18nphraseshavecities
has_many :i18nphraseshavethings
has_many :things, through: :i18nphraseshavethings
has_many :i18nphraseshaveplaces
has_many :places, through: :i18nphraseshaveplaces
has_many :i18nphraseshavepeople
has_many :people, through: :i18nphraseshavepeople
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(content_en) like ? or lower(content_fr) like ? or lower(content_de) like ?",o,o,o])
end

def self.findbyid(i)
where(id: i)
end

end
