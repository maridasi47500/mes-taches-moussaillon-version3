class Validation < ApplicationRecord
  has_and_belongs_to_many :scheduledtasks, :join_table => :mytablenames
  def name_with_initial
    self.name.capitalize
  end
end

