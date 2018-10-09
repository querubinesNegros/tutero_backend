# == Schema Information
#
# Table name: schedules
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  hour       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
