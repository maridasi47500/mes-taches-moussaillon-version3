class PostsSurnameMeaning < ApplicationRecord
belongs_to :posts_surname, class_name: 'PostsSurname', foreign_key: 'ps_id'
end
