class I18nphraseshaveperson < ApplicationRecord
belongs_to :i18nphrase
belongs_to :person
validates_uniqueness_of :i18nphrase_id, scope: :person
end
