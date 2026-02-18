class Guyacadeau < ApplicationRecord
belongs_to :address
belongs_to :person
accepts_nested_attributes_for :address,allow_destroy: true
after_initialize do
self.address||=Address.new
end
def self.prices
[10,20,30,100,200,500,1000,1000000]
end
end
