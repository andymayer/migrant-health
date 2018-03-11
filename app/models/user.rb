# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  title                  :string           default("")
#  first_name             :text
#  last_name              :text
#  role                   :integer          default("user")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?

  enum role: [:user, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :confirmable,
          :lockable,
          :timeoutable

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  acts_as_voter

  JOB_TITLES = [    "GP",
                    "GP registrar",
                    "Consultant (hospital)",
                    "Trainee Doctor",
                    "Practice Nurse",
                    "Community Nurse",
                    "Hospital Nurse",
                    "Health Care Assistant",
                    "GP Receptionist",
                    "Practice Manager",
                    "Health Visitor",
                    "Student"]

  INSTITUTIONS = [  "NHS - GP practice",
                    "NHS - hospital",
                    "University",
                    "Local government",
                    "Public Health England",
                    "CCG",
                    "NHS - commnity services"]

  LOCATIONS = [     "NW England",
                    "NE England",
                    "Scotland",
                    "Wales",
                    "Yorkshire and Humber",
                    "London",
                    "SE England",
                    "SW England",
                    "Midlands"]

  def display_name
    "#{title} #{first_name} #{last_name}"
  end

  def self.job_titles
    [   "GP",
        "GP registrar",
        "Consultant (hospital)",
        "Trainee Doctor",
        "Practice Nurse",
        "Community Nurse",
        "Hospital Nurse",
        "Health Care Assistant",
        "GP Receptionist",
        "Practice Manager",
        "Health Visitor",
        "Student",
        "Other"]
  end

  def self.institutions
    [ "NHS - GP practice",
      "NHS - hospital",
      "University",
      "Local government",
      "Public Health England",
      "CCG",
      "NHS - commnity services",
      "Other"]
  end

  def self.locations
    [ "NW England",
      "NE England",
      "Scotland",
      "Wales",
      "Yorkshire and Humber",
      "London",
      "SE England",
      "SW England",
      "Midlands",
      "Other"]
  end

  private

  def set_default_role
    self.role ||= :user
  end

end
