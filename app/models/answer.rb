class Answer < ApplicationRecord
belongs_to :question
attr_accessor :u
attr_accessor :m
attr_accessor :noq
attr_accessor :u1,:u2,:u3,:u4,:u5,:u6,:u7,:u8,:u9,:u10
attr_accessor :m1,:m2,:m3,:m4,:m5,:m6,:m7,:m8,:m9,:m10
attr_accessor :u11,:u12,:u13,:u14,:u15,:u16,:u17,:u18,:u19,:u20
attr_accessor :m11,:m12,:m13,:m14,:m15,:m16,:m17,:m18,:m19,:m20
def self.byquestion(i)
Question.find(i).answers.joins(:question).select('answers.text, answers.id, questions.typeq as qtype')
end

def mytext(typeq, u)
self.good =typeq=='u' && u && u == self.noq
if typeq=='m'
self.good = self.m=="1"
end

end

end
