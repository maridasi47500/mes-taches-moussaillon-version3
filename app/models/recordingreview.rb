class Recordingreview < ApplicationRecord
belongs_to :gooduser, class_name: 'User'
belongs_to :correctsample, class_name: 'Recording'
belongs_to :incorrectsample, class_name: 'Recording'
attr_accessor :correctsamplerecording, :contentcorrectsamplerecording
attr_accessor :incorrectsamplerecording, :contentincorrectsamplerecording
has_many :barattemptshaverecordings
has_many :barattempts, through: :barattemptshaverecordings
has_many :playedbars, through: :barattempts, source: :bar
has_many :scoreattempts, through: :playedbars, source: :musicalscore

before_validation :takerecording
has_many :audioreviewshavescorecriteria
has_many :scorecriteria, through: :audioreviewshavescorecriteria

has_many :audioreviewshavebarcriteria
has_many :barcriteria, through: :audioreviewshavebarcriteria

def takerecording
@i=0
begin
    if self.correctsamplerecording && self.correctsamplerecording.length > 0

        phrase=Phrase.new(content: self.contentcorrectsamplerecording) rescue Phrase.new

          w=""

          @rec1=Recording.new(name: self.correctsamplerecording[@i], content: (w.length > 0 ? w : phrase.content))



self.correctsample = @rec1

end
rescue
end
begin
    if self.incorrectsamplerecording && self.incorrectsamplerecording.length > 0

        phrase=Phrase.new(content: self.contentincorrectsamplerecording) rescue Phrase.new

          w=""

          @rec2=Recording.new(name: self.incorrectsamplerecording[@i], content: (w.length > 0 ? w : phrase.content))



self.incorrectsample = @rec2

end
rescue
end
end


end
