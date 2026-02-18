class Factoriesservicehaveemployeeepoch < ApplicationRecord
belongs_to :factoriesservicehaveemployee
belongs_to :epoch
validates_uniqueness_of :factoriesservicehaveemployee_id, scope: :epoch_id
end
