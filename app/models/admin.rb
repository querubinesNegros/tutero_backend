# == Schema Information
#
# Table name: admins
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Admin < ApplicationRecord
  has_one :user, as: :userable
  has_many :posts

  default_scope { joins(:user).select("*") }

  def self.postsAfter(publicatitonDate)
    joins(:posts).where("posts.created_at > ?", publicatitonDate)
  end
end
