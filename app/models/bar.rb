class Bar < ApplicationRecord
has_many :barshavekeys
has_many :musicalkeys, :through => :barshavekeys
has_many :barshavemusicalinstruments
has_many :musicalinstruments, through: :barshavemusicalinstruments
self.table_name = 'musical_bars'
belongs_to :correct, class_name: 'Recording'
belongs_to :musicalscore
attr_accessor :correctsample, :contentcorrectsample
before_validation :takerecording
has_many :barattempts
has_many :peoplewhoattemptedtoplaybars, through: :barattempts, source: :person
has_many :barcriteria
def self.precedent(i)
all.limit(10).offset(i.to_i - 1).to_a.length > 0
end
def self.suivant(i)
all.limit(10).offset(i.to_i + 1).to_a.length > 0
end

def self.navigbars(i)
all.limit(10).offset(i.to_i)
end

def image=(file)
    if file.is_a?(String)
    self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

    end
end
def takerecording
@i=0
    if self.correctsample && self.correctsample.length > 0

        phrase=Phrase.new(content: self.contentcorrectsample) rescue Phrase.new

          w=""

          @rec1=Recording.new(name: self.correctsample[@i], content: (w.length > 0 ? w : phrase.content))



self.correct = @rec1

end
end

end
