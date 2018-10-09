# == Schema Information
#
# Table name: fileps
#
#  id             :bigint(8)        not null, primary key
#  filepable_type :string
#  filepable_id   :bigint(8)
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  post_id        :bigint(8)
#

require 'test_helper'

class FilepTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
