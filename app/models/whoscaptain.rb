class Whoscaptain < ApplicationRecord
belongs_to :grade, class_name: 'Armygrade'
belongs_to :superiorgrade, class_name: 'Armygrade'
end
