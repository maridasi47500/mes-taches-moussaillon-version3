class Technique < Task
  has_and_belongs_to_many :tasks
  belongs_to :city, optional: true
  belongs_to :country, optional: true
end 
