class Companieshavecustomer < ApplicationRecord
belongs_to :employee, class_name: 'Person'
belongs_to :customer, class_name: 'Person'
belongs_to :user
belongs_to :company,:polymorphic => true 




validates_presence_of :company_id
belongs_to :nationality
end
