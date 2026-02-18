#class Event < ApplicationRecord
#  has_and_belongs_to_many :tasks #events_tasks
#  has_and_belongs_to_many :posts #events_posts
#  has_many :relatedevents, class_name: 'Event', foreign_key: 'event_id'
#  belongs_to :mainevent, class_name: 'Event', foreign_key: 'event_id'
#  
#end
