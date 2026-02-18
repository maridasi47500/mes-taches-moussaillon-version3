class Aidememoire < ApplicationRecord
  
  attr_accessor :addmyrelation_id, :addmyrelation_text, :addmybigrelation_id, :addmymiddlerelation_id
  attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :recordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :recordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2, :contentrecordmyownphrasesandwords1, :contentrecordmyownphrasesandwords2, :contentmyownphrasesandwords1
before_validation :savephrasesandwords
def self.nbpages
(all.length / 10).to_i
end
def self.bypage(i)
all.limit(10).offset(i)
end

  def savephrasesandwords
    #phrase and word
    if myownphrasesandwords1 && myownphrasesandwords2 && myownphrasesandwords1.length > 0 && myownphrasesandwords2.length > 0 && myownphrasesandwords1.length == myownphrasesandwords2.length
      p "celuici"
      @i=0
      1.times do
        self.recordedphrase=Recording.new(name: self.myownphrasesandwords1[@i], content: self.contentmyownphrasesandwords1)
        self.recordedword=Recording.new(name: self.myownphrasesandwords2[@i], content: self.contentmyownphrasesandwords2)

      @i+=1
      end

    end



  end


  belongs_to :recordedphrase, foreign_key: "recordingphrase_id", class_name: "Recording",optional:true
  belongs_to :recordedword, foreign_key: "recordingword_id", class_name: "Recording"
  has_many :phraseandwords
  has_many :onlywords
  has_many :onlyphrases
  attr_accessor :myrelationtoselect
  has_and_belongs_to_many :tasks, :join_table => :taskshaveaidememoires
  has_and_belongs_to_many :people, :join_table => :peoplehavephrasesandwords
  has_and_belongs_to_many :relations, :join_table => :aidememoirehaverelations
  has_and_belongs_to_many :middlerelations, :join_table => :aidememoirehavemiddlerelations, class_name: "Relation"
  has_and_belongs_to_many :bigrelations, :join_table => :aidememoirehavebigrelations, class_name: "Relation"
  def self.allmyaidememoires
    Aidememoire.all.joins('left join taskshaveaidememoires a on a.aidememoire_id = aidememoires.id').joins('left join tasks t on t.id = a.task_id').select('a.task_id as atid, aidememoires.*, a.aidememoire_id as tid, t.id as taskid, t.name_'+I18n.locale.to_s+' as tname').group_by {|x| x['tname']}
  end
  def self.allmyaidememoiressuite
    Aidememoire.all.joins('left join recordings rec1 on aidememoires.recordingword_id = rec1.id').joins('left join recordings rec on aidememoires.recordingphrase_id = rec.id').joins('left join aidememoirehaverelations r on aidememoires.id = r.aidememoire_id').joins('left join relations realr on realr.id = r.relation_id').joins('left join taskshaveaidememoires a on a.aidememoire_id = aidememoires.id').joins('left join tasks t on t.id = a.task_id').select('a.task_id as atid, aidememoires.*, a.aidememoire_id as tid, t.id as taskid, t.name_'+I18n.locale.to_s+' as tname,rec1.id, rec.id, r.aidememoire_id, r.relation_id, realr.id, realr.name_en,rec.content_'+I18n.locale.to_s+' as content,rec.content_en,rec.content_de,rec.content_fr, rec1.content_fr,rec1.content_de,rec1.content_en,realr.name_'+I18n.locale.to_s+' as name1, realr.name_de as name2,realr.name_fr as name3, realr.name_en as name4').group('rec.content_'+I18n.locale.to_s).where(['realr.name_en in (?)','then']).group_by {|x| x['tname']}
  end
  def firstrelation
    if self.relations.length > 1
    relations[0].name
    else 
      ""
    end
  end
  def firstrelationid
    if self.relations.length > 1
    relations[0].id
    else 
      ""
    end
  end

  def secondrelation
    if self.relations.length > 1 
      relations[1].name 
    elsif self.relations.length > 0
      relations[0].name
    end
  end
  def secondrelationid
    if self.relations.length > 1 
      relations[1].id 
    elsif self.relations.length > 0
      relations[0].id
    end
  end
  
  def opposite
    (phraseandwords.length > 0 && phraseandwords[0].opposite)||(phraseandwords.length > 1 && phraseandwords[1].opposite)
  end
  def notopposite
    !((phraseandwords.length > 0 && phraseandwords[0].opposite)||(phraseandwords.length > 1 && phraseandwords[1].opposite))
  end

end
