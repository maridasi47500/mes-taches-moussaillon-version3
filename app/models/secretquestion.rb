class Secretquestion < ApplicationRecord
has_many :usersecretquestions
has_many :answers, foreign_key: "question_id", class_name:'Secretanswer', autosave: true
accepts_nested_attributes_for :answers
  before_validation :remove_blank_articles!

  private
    def remove_blank_articles!
      self.usersecretquestions = usersecretquestions - usersecretquestions.select(&:blank?)
      true
    end

attr_accessor :u
#attr_accessor :u1,:u2,:u3,:u4,:u5,:u6,:u7,:u8,:u9,:u10
#attr_accessor :m1,:m2,:m3,:m4,:m5,:m6,:m7,:m8,:m9,:m10
#attr_accessor :u11,:u12,:u13,:u14,:u15,:u16,:u17,:u18,:u19,:u20
#attr_accessor :m11,:m12,:m13,:m14,:m15,:m16,:m17,:m18,:m19,:m20
before_validation :mytext
def self.nbpages
all.length / 10
end
def self.bypage(i)
all.limit(10).offset(i.to_i * 10).order(created_at: :desc)
end

def self.newgoodanswers(nb)
a=self.new
a.setgoodansweruniqueanswer
(1..nb.to_i).each do |u|
answer=a.answers.new
answer.u = u
answer.noq = u
end
a

end 

def updatemyanswersnb
self.setgoodansweruniqueanswer
self.answers.each_with_index do |s,i|
s.u = (i+1)
s.noq = (i+1)
end

end

def setgoodansweruniqueanswer
if self.typeq == 'u'
self.u = self.answers.map.with_index {|x,i|[x,(i+1)]}.select {|x|x[0].true}[0][1] rescue nil
end
end
def multipleanswer
self.typeq == "m"
end
def uniqueanswer
self.typeq == "u"
end
def mytext

self.answers.each {|x|x.mytext(self.typeq, self.u)}

end



end
