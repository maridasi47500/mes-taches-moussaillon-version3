class Requeststopersonhaverequestperson < ApplicationRecord
belongs_to :requestperson
belongs_to :requeststoperson
validates_uniqueness_of :requestperson_id, scope: :requeststoperson_id
has_many :aregoodrequests
end
