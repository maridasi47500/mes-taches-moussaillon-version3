class Onetime < ApplicationRecord
  belongs_to :person
  
  def pronounpersonpossess
    self.person.pronoun.name.split('/')[0].humanize
  end
  def pronounpersonpers
    self.person.pronoun.name.split('/')[1].humanize
  end
  def title=(x)
    write_attribute(:title,x)
    save
  end
  def nomdactrice
    self.person.name.titleize
  end
  def posteractrice
    self.person.image
  end
  
end
