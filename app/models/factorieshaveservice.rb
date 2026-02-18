class Factorieshaveservice < ApplicationRecord
belongs_to :factory
belongs_to :factoryservice
validates_uniqueness_of :factoryservice_id, scope: :factory_id
end
