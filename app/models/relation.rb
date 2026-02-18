class Relation < ApplicationRecord
  translates :name
  def self.mostusual
    Relation.where(name_en: ["so","then","because","now","but","no","if","when","that"])
  end
  def self.other
    Relation.where(name_en: ["as a reminder","not to do","and not"])
  end
end
