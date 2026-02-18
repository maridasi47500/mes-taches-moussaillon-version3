class Barshavekey < ApplicationRecord
belongs_to :bar
belongs_to :musicalkey
validates_uniqueness_of :bar_id, scope: :musicalkey_id
end
