class LangueRecording < ApplicationRecord
belongs_to :language
belongs_to :emotion
belongs_to :recording

end
