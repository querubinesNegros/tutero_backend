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

class User < ApplicationRecord
  belongs_to :career, optional: :true
  belongs_to :userable, polymorphic: true, optional: true
  has_many :tutorings
  has_many :answers
  has_secure_password :validations => false
  
  VALID_EMAIL_UNAL = /(([a-zA-Z]+_[a-zA-Z]+)||([a-zA-Z]+))@unal.edu.co/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/i
  validates :password_digest, presence: true, if: :google_acount?
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 10, maximum: 50},
                    format: {with: VALID_EMAIL_REGEX}
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :lastname, presence: true, length: {minimum: 2, maximum: 50}
  
  #consultas
  def self.getUsersByCareer(career_id)
    User.where(career_id: career_id, userable_type: "Tutor" )
  end

  def self.getCareerByID(id_c)
    Career.select("id, name").where(id: id_c).first
  end
  def self.getType(email)
    User.where(email: email).pluck("userable_type , career_id")
  end

  scope :search, -> (params) { where(email: params) }

  def self.userable_id(user_id)
    User.where(id: user_id).pluck("userable_id")
  end
  def google_acount?
    g = GoogleAcount.where(email: email).first
    print(g)
    print("****************************\n")
    if g == nil
     
      return true
    else
       
       return false
    end
  end
end
