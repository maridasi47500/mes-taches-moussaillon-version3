class Phraseandword < ApplicationRecord
  belongs_to :aidememoire
  belongs_to :phrase, class_name: "Phrase"
  belongs_to :word, class_name: "Word"

end
