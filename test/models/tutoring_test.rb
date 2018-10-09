# == Schema Information
#
# Table name: tutorings
#
#  id          :bigint(8)        not null, primary key
#  topic_id    :bigint(8)
#  type_t      :string
#  schedule_id :bigint(8)
#  duration    :integer
#  noteStudent :text
#  noteTutor   :text
#  student_id  :bigint(8)
#  date        :date
#  score       :integer
#  review      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class TutoringTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
