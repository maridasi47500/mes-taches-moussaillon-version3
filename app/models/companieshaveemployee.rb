class Companieshaveemployee < ApplicationRecord
belongs_to :employee, class_name: 'Person'
belongs_to :employer, class_name: 'Person', optional: true
belongs_to :job
belongs_to :company

belongs_to :user
belongs_to :nationality
end
