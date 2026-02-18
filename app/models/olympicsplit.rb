 class Olympicsplit < ApplicationRecord
belongs_to :olympicresult
belongs_to :olympicdistance
def time=(x)
p x
if x == "-" || x == "–"
write_attribute(:time, nil)
elsif x
p "time result"
t1=x.to_s.split(' ')[0]+"0"
t1=t1.include?(':') ? t1 : "0:"+t1
t=DateTime.strptime(t1, '%M:%S.%L') rescue nil
write_attribute(:time, t)
end
end
def time
read_attribute(:time)
end
end
