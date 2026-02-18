class Listhackedi18nphrase < ApplicationRecord
belongs_to :i18nphrase
belongs_to :post
validates_uniqueness_of :i18nphrase_id, scope: :post_id
end
