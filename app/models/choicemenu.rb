class Choicemenu < ApplicationRecord
belongs_to :user
belongs_to :webpage
belongs_to :mymenu
translates :content
end