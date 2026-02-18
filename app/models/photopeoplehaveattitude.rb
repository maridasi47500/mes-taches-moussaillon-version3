class Photopeoplehaveattitude < ApplicationRecord
belongs_to :attitude
belongs_to :person
belongs_to :attitudephoto
validates_uniqueness_of :attitude_id, scope: [:person_id, :attitudephoto_id]

end
