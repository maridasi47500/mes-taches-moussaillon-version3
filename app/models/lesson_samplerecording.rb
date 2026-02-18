class LessonSamplerecording < ApplicationRecord
belongs_to :lesson_samplecontent
belongs_to :recordingfemme, optional: true
belongs_to :recordinghomme, optional: true

  before_validation :savephrasesandwords, :on =>[:create, :update]
  attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :recordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :recordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2

def savephrasesandwords
    if self.recordmyphrasesandwords1 && self.recordmyphrasesandwords1.length > 0 && self.recordmyphrasesandwords2 && self.recordmyphrasesandwords2.length > 0
p "phrase amd phrase"
        begin
        phrase= Phrase.find(self.myownphrasesandwords2[@i])
         rescue
        phrase=Phrase.new(content: self.contentmyownphrasesandwords2[@i]) rescue Phrase.new
         end

          w=self.contentmyownphrasesandwords2[@i].strip.squish rescue ""

          @rec1=Recording.new(name: self.recordmyphrasesandwords2[@i], content: (w.length > 0 ? w : phrase.content))
        begin
        phrase= Phrase.find(self.myownphrasesandwords1[@i])
         rescue
        phrase=Phrase.new(content: self.contentmyownphrasesandwords1[@i]) rescue Phrase.new
         end

          w=self.contentmyownphrasesandwords1[@i].strip.squish rescue ""

          @rec2=Recording.new(name: self.recordmyphrasesandwords1[@i], content: (w.length > 0 ? w : phrase.content))



        end
self.recordingfemme = @rec1
self.recordinghomme = @rec2
end
end
