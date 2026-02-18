class Navette < ApplicationRecord
belongs_to :citya, class_name: "City"
belongs_to :cityb, class_name: "City"
has_many :navettepersonarmycompagnies
has_many :personarmycompagnies, through: :navettepersonarmycompagnies
def self.bydate
group(:go).order(go: :desc)
end
def self.bydates(date)
where(go:  DateTime.strptime(date,I18n.t("date.formats")[:mydateurl]).to_date)
end
end
