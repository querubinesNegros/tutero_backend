# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  password_digest :string
#  cellphone       :string
#  career_id       :bigint(8)
#  userable_type   :string
#  userable_id     :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#  lastname        :string
#  pict            :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
