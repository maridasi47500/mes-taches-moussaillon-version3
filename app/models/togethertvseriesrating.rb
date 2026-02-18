class Togethertvseriesrating < ApplicationRecord
has_and_belongs_to_many :people, :join_table => :tvseriesratingshavepeople
belongs_to :tvserieshaveactor
#has_many :tvserieshaveactors, through: :tvserieshaveactor
belongs_to :user
translates :content
def comment
content
end
end
