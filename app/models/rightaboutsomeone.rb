class Rightaboutsomeone < ApplicationRecord
attr_accessor :isittruephrase_ids, :isittrueactionlist_ids
translates :question
translates :description
has_and_belongs_to_many :phrases, :join_table => :rightaboutsomeonehavesentences
has_and_belongs_to_many :actionlists, :join_table => :rightaboutsomeonehavetruths
accepts_nested_attributes_for :phrases, allow_destroy: true
accepts_nested_attributes_for :actionlists, allow_destroy: true
has_and_belongs_to_many :truephrases, :join_table => :trueansweraboutsomeonephrases, class_name: 'Phrase'
has_and_belongs_to_many :trueactionlists, :join_table => :trueansweraboutsomeoneactionlists, class_name: 'Actionlist'
end
