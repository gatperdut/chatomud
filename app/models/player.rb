# frozen_string_literal: true

class Player < ActiveRecord::Base
  extend Devise::Models 

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :setting, dependent: :destroy

  has_many :characters, dependent: :destroy

  validates :email, uniqueness: true

  # \A => start of the string, \z => end of the string (including \n)
  validates :nickname, format: { with: /\A\w+\z/ }, uniqueness: true, length: { within: 3..20 }

  validates :nickname, :setting, presence: true

  validate :max_one_active_character

  validates_associated :setting, :characters

  accepts_nested_attributes_for :setting

  def current_character
    characters.find_by_active(true)
  end

  private

  def max_one_active_character
    return unless characters.select(&:active).count > 1

    errors.add(:characters, "there can be only 1 active at any given time")
  end

end
