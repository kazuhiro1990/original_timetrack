class Tracktime < ApplicationRecord
  belongs_to :project, optional: true

end
