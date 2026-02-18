@results=Olympicresult.where.not(time: nil)[-10..-1]
myres= @results.map(&:time).map{|y|[(y.time.to_i - y.time.to_date.to_time.to_i + 11000 - 200).to_i, y.strftime('%L').to_i]}
thistime=Time.at(myres.map{|y|y[0]}.sum,myres.map{|y|y[1]}.sum)

p thistime
