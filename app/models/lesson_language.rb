class LessonLanguage < ApplicationRecord
belongs_to :lesson
belongs_to :from, class_name:'Language',foreign_key:'locale_from_id'
belongs_to :to, class_name:'Language',foreign_key:'locale_to_id'
def fromlocale
from.locale
end
def tolocale
to.locale
end
def self.mylanguages
joins('left join languages l on l.id = lesson_languages.locale_from_id').where('left join languages l2 on l2.id = lesson_languages.locale_to_id').select('l.*,l2.*,lesson_languages.*,l.locale as loc1, l2.locale as loc2')


end
end
