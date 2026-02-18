class Beautifulschool < ApplicationRecord

belongs_to :user
belongs_to :school
belongs_to :person, foreign_key:"person_id", class_name: "PostsSurname"
accepts_nested_attributes_for :person, allow_destroy: true
def notemeaning
case note
when 5
"très jolie"
when 4
"belle"
when 3
"sympa"
when 2
"pas super cool cette"
when 1
"pourrie cette"
end
end
end
