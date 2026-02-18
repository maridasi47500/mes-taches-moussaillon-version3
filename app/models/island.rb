class Island < ApplicationRecord
   has_and_belongs_to_many :beaches, :join_table => :islandshavebeaches
   belongs_to :address, optional: true
end
