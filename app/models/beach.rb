class Beach < ApplicationRecord
     has_and_belongs_to_many :islands, :join_table => :islandshavebeaches
     has_and_belongs_to_many :streets, :join_table =>:beachstrassen, class_name: 'Rue'
	accepts_nested_attributes_for :streets, allow_destroy: true

   has_and_belongs_to_many :aidememoires, class_name: "Aidememoire", :join_table => :beacheshaveaidememoires
   attr_accessor :myislandids
  accepts_nested_attributes_for :aidememoires, allow_destroy: true
    attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :recordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :recordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2
  attr_accessor :addmyrelation_id, :addmyrelation_text, :addmybigrelation_id, :addmymiddlerelation_id
  before_validation :savephrasesandwords, :on =>[:create, :update]
  def savephrasesandwords
    #phrase and word

    if recordmyphrasesandwords1 && recordmywords1 && recordmyphrasesandwords1.length > 0 && recordmywords1.length > 0 && recordmyphrasesandwords1.length == recordmywords1.length
      @i=0
      1.times do
        self.aidememoires.new do |x|
          pandw=x.phraseandwords.new do |y|
        y.phrase= Phrase.find(self.myownphrasesandwords1[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords1[@i])
        y.word = Word.find(self.myownwords1[@i]) rescue Word.new(word: self.contentmyownwords1[@i])
            y.opposite=false
          end
          x.relations = Relation.where(id: self.addmyrelation_id)
          x.bigrelations = Relation.where(id: self.addmybigrelation_id)
          x.middlerelations = Relation.where(id: self.addmymiddlerelation_id)
          paw=self.contentmyownphrasesandwords1[@i].strip.squish
          w=self.contentmyownwords1[@i].strip.squish
          x.recordedphrase=Recording.new(name: self.recordmywords1[@i], content: (paw.length > 0 ? paw : pandw.phrase.content))
          x.recordedword=Recording.new(name: self.recordmyphrasesandwords1[@i], content: (w.length > 0 ? w : pandw.word.content))

        end
      end
      
    end
    #word then phrase
    if recordmyphrasesandwords2 && recordmywords2 && recordmyphrasesandwords2.length > 0 && recordmywords2.length > 0 && recordmyphrasesandwords2.length == recordmywords2.length
      @i=0
      1.times do
      self.aidememoires.new do |x|
        pandw=x.phraseandwords.new do |y|
        y.phrase= Phrase.find(self.myownphrasesandwords2[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords2[@i])
        y.word = Word.find(self.myownwords2[@i]) rescue Word.new(word: self.contentmyownwords2[@i])
        y.opposite=true
        end
        paw=self.contentmyownphrasesandwords2[@i].strip.squish
        w=self.contentmyownwords2[@i].strip.squish
          x.relations = Relation.where(id: self.addmyrelation_id)
          x.bigrelations = Relation.where(id: self.addmybigrelation_id)
          x.middlerelations = Relation.where(id: self.addmymiddlerelation_id)

        x.recordedphrase=Recording.new(name: self.recordmywords2[@i], content: (paw.length > 0 ? paw : pandw.phrase.content))
        x.recordedword=Recording.new(name: self.recordmyphrasesandwords2[@i], content: (w.length > 0 ? w : pandw.word.content))
        
      end
      end
      
    end
    #two words
    if recordmywords1 && recordmywords2 && recordmywords1.length > 0 && recordmywords2.length > 0 && recordmywords1.length == recordmywords2.length
      @i=0
      1.times do
      self.aidememoires.new do |x|
        pandw=x.onlywords.new do |y|
        y.word1= Word.find(self.myownwords1[@i]) rescue Word.new(word: self.contentmyownwords1[@i])
        y.word2 = Word.find(self.myownwords2[@i]) rescue Word.new(word: self.contentmyownwords2[@i])
        end
        paw=self.contentmyownwords1[@i].strip.squish
        w=self.contentmyownwords2[@i].strip.squish
          x.relations = Relation.where(id: self.addmyrelation_id)
          x.bigrelations = Relation.where(id: self.addmybigrelation_id)
          x.middlerelations = Relation.where(id: self.addmymiddlerelation_id)

        x.recordedphrase=Recording.new(name: self.recordmywords1[@i], content: (paw.length > 0 ? paw : pandw.word1.content))
        x.recordedword=Recording.new(name: self.recordmywords2[@i], content: (w.length > 0 ? w : pandw.word2.content))
        
      end
      @i+=1
      end
      
    end
#onlyphrases
    if recordmyphrasesandwords1 && recordmyphrasesandwords2 && recordmyphrasesandwords1.length > 0 && recordmyphrasesandwords2.length > 0 && recordmyphrasesandwords1.length == recordmyphrasesandwords2.length
      @i=0
      1.times do
      self.aidememoires.new do |x|
        pandw=x.onlyphrases.new do |y|
        y.phrase1= Phrase.find(self.myownphrasesandwords1[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords1[@i])
        y.phrase2 = Phrase.find(self.myownphrasesandwords2[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords2[@i])
        end
        paw=self.contentmyownphrasesandwords1[@i].strip.squish
        w=self.contentmyownphrasesandwords2[@i].strip.squish
        p Relation.where(id: self.addmyrelation_id)
          x.relations = Relation.where(id: self.addmyrelation_id)
          x.bigrelations = Relation.where(id: self.addmybigrelation_id)
          x.middlerelations = Relation.where(id: self.addmymiddlerelation_id)
        p x.relations
        p x.errors
        p x.errors
        x.recordedphrase=Recording.new(name: self.recordmyphrasesandwords1[@i], content: (paw.length > 0 ? paw : pandw.phrase1.content))
        x.recordedword=Recording.new(name: self.recordmyphrasesandwords2[@i], content: (w.length > 0 ? w : pandw.phrase2.content))
        
      end
      @i+=1
      end
      
    end
    self.islands=Island.where(id: self.myislandids)


    
    

    
  end
  def aidememoiresanticlockwise
    self.aidememoires.reverse

  end


  
end
