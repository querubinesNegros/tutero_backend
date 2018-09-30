class Tutoring < ApplicationRecord
  belongs_to :topic
  belongs_to :schedule
  belongs_to :student
end
