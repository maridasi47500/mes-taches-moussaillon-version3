class Actionlist < ApplicationRecord
translates :title
has_and_belongs_to_many :taskactions, :join_table => :actionlisthaveactions
accepts_nested_attributes_for :taskactions, allow_destroy: true

end
