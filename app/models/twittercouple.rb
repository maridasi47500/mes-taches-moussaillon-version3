class Twittercouple < ApplicationRecord
belongs_to :twitteraccount
belongs_to :othertwitteraccount, class_name: "Twitteraccount"
validates_uniqueness_of :twitteraccount_id, scope: :othertwitteraccount_id
end
