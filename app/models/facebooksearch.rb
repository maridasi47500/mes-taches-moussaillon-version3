class Facebooksearch < ApplicationRecord
  has_and_belongs_to_many :tasks, :join_table => :linkfacebooksearchtasks
  accepts_nested_attributes_for :tasks, allow_destroy: true
  has_many :resultsoffbsearches, foreign_key: "facebooksearch_id"
  has_many :facebook_results, through: :resultsoffbsearches, source: :facebooksearch, class_name: "Person"
  accepts_nested_attributes_for :facebook_results, allow_destroy: true
end
