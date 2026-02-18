class Twopeoplehavecompany < ApplicationRecord
belongs_to :twoperson
belongs_to :company

validates_uniqueness_of :company_id, scope: :twoperson_id
end

