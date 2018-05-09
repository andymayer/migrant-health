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
#  job_title              :string
#  institution            :string
#  location               :string
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

  validate :allowed_email_addresses

  acts_as_voter

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
      "NHS - community services",
      "Other"]
  end

  def self.locations
    [ "England - East Midlands",
      "England - East of England",
      "England - London",
      "England - North East",
      "England - North West",
      "England - South East",
      "England - South West",
      "England - West Midlands",
      "England - Yorkshire and the Humber",
      "Scotland",
      "Wales",
      "Northern Ireland",
      "Outside the UK"]
  end

  private

  def set_default_role
    self.role ||= :user
  end

  def allowed_email_addresses
    allowed_email_domains = ENV['ALLOWED_EMAIL_DOMAINS'].split(',')
    allowed = false
    allowed = true if allowed_email_domains.any? {|allowed_email_domain| email.end_with? "@#{allowed_email_domain}"}
    allowed = true if allowed_email_domains.any? {|allowed_email_domain| email.end_with? ".#{allowed_email_domain}"}
    errors.add(:email, "is not allowed by this website") if !allowed
  end

end
