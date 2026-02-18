class Couplethavecomposedcontent < ApplicationRecord
    belongs_to :composedcontent
    accepts_nested_attributes_for :composedcontent
    belongs_to :musicalcomposition, optional: true

  belongs_to :user,optional: true
  belongs_to :couplet
    attr_accessor :userid, :compoid
   before_save :setuserid
    private
 def setuserid

     self.user_id = self.userid
          self.musicalcomposition_id = self.compoid


 end


end
