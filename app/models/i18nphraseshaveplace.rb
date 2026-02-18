class I18nphraseshaveplace < ApplicationRecord
belongs_to :i18nphrase
belongs_to :place
validates_uniqueness_of :i18nphrase_id, scope: :place_id
end
