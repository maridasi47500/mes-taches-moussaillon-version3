class Factorieshaveworker < ApplicationRecord
belongs_to :factory
belongs_to :person
validates_uniqueness_of :factory_id, scope: :person_id
has_and_belongs_to_many :epochs, :join_table => :epochhavefactorieshaveworkers

end
