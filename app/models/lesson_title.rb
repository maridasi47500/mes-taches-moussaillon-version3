class LessonTitle < ApplicationRecord
belongs_to :lesson
belongs_to :user
belongs_to :recordingfemme, optional: true, class_name: 'Recording' 
belongs_to :recordinghomme, optional: true, class_name: 'Recording'

  before_validation :savephrasesandwords, only: [:create,:update]

  attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :contentrecordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1,:recordmyphrasesandwords1,:recordmyphrasesandwords2, :contentrecordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2

def self.user(id)
where('lesson_titles.user_id'=>id)
end
def savephrasesandwords
p "phrase amd phrase"
@i=0
    if self.recordmyphrasesandwords1 && self.recordmyphrasesandwords1.length > 0 && self.recordmyphrasesandwords2 && self.recordmyphrasesandwords2.length > 0

        begin
        phrase= Phrase.find(self.myownphrasesandwords2[@i])
         rescue
        phrase=Phrase.new(content: self.contentrecordmyphrasesandwords2) rescue Phrase.new
         end

          w=self.recordmyphrasesandwords2[@i].strip.squish rescue ""

          @rec1=Recording.new(name: self.recordmyphrasesandwords2[@i], content: (w.length > 0 ? w : phrase.content))
        begin
        phrase= Phrase.find(self.myownphrasesandwords1[@i])
         rescue
        phrase=Phrase.new(content: self.contentrecordmyphrasesandwords1) rescue Phrase.new
         end

          w=self.recordmyphrasesandwords1[@i].strip.squish rescue ""

          @rec2=Recording.new(name: self.recordmyphrasesandwords1[@i], content: (w.length > 0 ? w : phrase.content))



self.recordingfemme = @rec1
self.recordinghomme = @rec2
        end

end
def self.groupbysentence
order('id')
end
def mycontent
lesson.title
end
end
