class Onlyphrase < ApplicationRecord
  belongs_to :aidememoire
  belongs_to :phrase1, class_name: "Phrase"
  belongs_to :phrase2, class_name: "Phrase"

end

