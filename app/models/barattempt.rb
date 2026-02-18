class Barattempt < ApplicationRecord
belongs_to :user
belongs_to :sample, class_name: 'Recording'
belongs_to :bar
belongs_to :person
has_many :barattemptshaverecordings
has_many :recordingreviews, through: :barattemptshaverecordings
has_many :barreviews

accepts_nested_attributes_for :recordingreviews
accepts_nested_attributes_for :barreviews
attr_accessor :samplerecording, :contentsamplerecording
before_validation :takerecording

def takerecording
@i=0
    if self.samplerecording && self.samplerecording.length > 0

        phrase=Phrase.new(content: self.contentsamplerecording) rescue Phrase.new

          w=""

          @rec1=Recording.new(name: self.samplerecording[@i], content: (w.length > 0 ? w : phrase.content))



self.sample = @rec1

end
end


end
