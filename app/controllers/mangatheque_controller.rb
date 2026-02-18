class MangathequeController < ApplicationController
  def index
@people=[]
["sailor moon","arima","mafalda"].each do |str|
      @o='%'+str.gsub(' ','%').downcase+'%'
        @people+=PostsSurname.findthem(@o)
end

  end
end
