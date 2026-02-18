class PostTypesPost < ApplicationRecord
belongs_to :post_type
belongs_to :post
end
