class Secretoccupation < ApplicationRecord
translates :content
belongs_to :aboutsomeonegossip
belongs_to :alias,optional: true
has_and_belongs_to_many :places, :join_table => :secretoccupationshaveplaces
has_and_belongs_to_many :people, :join_table => :secretoccupationshavepeople

end
