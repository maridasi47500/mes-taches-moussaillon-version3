class Barshavemusicalinstrument < ApplicationRecord
belongs_to :bar
belongs_to :musicalinstrument
validates_uniqueness_of :bar_id, scope: :musicalinstrument_id
end
