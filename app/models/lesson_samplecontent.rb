class LessonSamplecontent < ApplicationRecord
belongs_to :lesson
belongs_to :recordingfemme, optional: true, class_name:'Recording'
belongs_to :recordinghomme, optional: true, class_name:'Recording'
has_many :lesson_samplerecordings
has_many :lesson_words
accepts_nested_attributes_for :lesson_words
translates :content
  before_save :savephrasesandwords
  attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :recordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :recordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2
def mycontent(locale)
self["content_#{locale}"]

end
def splitsentence(locale)
I18n.locale = locale
w1=self.content.split('...')
w1=w1.map {|x| [x,self.lesson_words.where(locale: locale)[x.to_i]||LessonWord.new]}
w1


end
def myfields
w1=self.content_en.split('...').length - 1
w1=self.content_en.include?('...') && w1 >= 0 ? "0".upto((w1).to_s).map {|x| self.lesson_words.where(locale:'en')[x.to_i]||LessonWord.new} : []
w2=self.content_fr.split('...').length - 1
w2=self.content_fr.include?('...') && w2 >= 0 ? "0".upto((w2).to_s).map {|x| self.lesson_words.where(locale:'fr')[x.to_i]||LessonWord.new} : []
w3=self.content_de.split('...').length - 1
w3=self.content_de.include?('...') && w3 >= 0 ? "0".upto((w3).to_s).map {|x| self.lesson_words.where(locale:'de')[x.to_i]||LessonWord.new} : []
[['english','en',w1],['french','fr',w2],['german','de',w3]]

end
def savephrasesandwords
p "MY MODEL"
@i=0
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
