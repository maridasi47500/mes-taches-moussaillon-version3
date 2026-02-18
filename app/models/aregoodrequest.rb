class Aregoodrequest < ApplicationRecord
belongs_to :alias
belongs_to :emoticon
belongs_to :requeststopersonhaverequestperson
has_one :requeststoperson, through: :requeststopersonhaverequestperson
end
