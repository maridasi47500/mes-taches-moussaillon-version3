class I18nphraseshavething < ApplicationRecord
belongs_to :i18nphrase
belongs_to :thing
validates_uniqueness_of :i18nphrase_id, scope: :thing_id
end

