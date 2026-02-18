class Idolcomment < ApplicationRecord
belongs_to :tvserieshaveactor
belongs_to :alias
translates :content
end
