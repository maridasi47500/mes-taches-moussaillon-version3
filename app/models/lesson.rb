class Lesson < ApplicationRecord
has_many :lesson_languages
belongs_to :user
has_many :lesson_sentences
has_many :lesson_titles


has_many :senrecs, :through => :lesson_sentences, source: :lesson_recordings
has_many :lesson_applications
has_many :apprecs, :through => :lesson_applications, source: :lesson_recordings
accepts_nested_attributes_for :lesson_languages

accepts_nested_attributes_for :lesson_sentences, allow_destroy: true
accepts_nested_attributes_for :lesson_applications, allow_destroy: true
accepts_nested_attributes_for :lesson_titles, allow_destroy: true
belongs_to :recordingfemme, optional: true, class_name: 'Recording' 
belongs_to :recordinghomme, optional: true, class_name: 'Recording'

  before_validation :savephrasesandwords, only: [:create,:update]

  attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :contentrecordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1,:recordmyphrasesandwords1,:recordmyphrasesandwords2, :contentrecordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2


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
def my_lesson_languages
lesson_languages.mylanguages.pluck('l.locale', 'l2.locale')
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
end
