class Frontpage < ApplicationRecord
has_and_belongs_to_many :people,:join_table => :frontpagepeople
def groupphoto
end
end
