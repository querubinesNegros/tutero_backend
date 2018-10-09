# == Schema Information
#
# Table name: users
#
#  id            :bigint(8)        not null, primary key
#  email         :string
#  password      :string
#  cellphone     :string
#  career_id     :bigint(8)
#  userable_type :string
#  userable_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string
#  lastname      :string
#

class User < ApplicationRecord
  belongs_to :career
  belongs_to :userable, polymorphic: true, optional: true
  has_many :tutorings

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/i

  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 10, maximum: 50},
                    format: {with: VALID_EMAIL_REGEX}
  #validates :password, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 8, maximum: 50 },
  #format: { with: VALID_PASSWORD_REGEX }
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :lastname, presence: true, length: {minimum: 2, maximum: 50}
  #validates :userable, presence: true

end
