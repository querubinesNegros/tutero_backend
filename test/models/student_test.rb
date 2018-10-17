# == Schema Information
#
# Table name: students
#
#  id         :bigint(8)        not null, primary key
#  age        :integer
#  stratus    :integer
#  pbm        :integer
#  tutor_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
