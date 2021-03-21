require "chato_mud/mixins/players/roles/definition"

class Player < ActiveRecord::Base

  before_validation :generate_setting, on: [:create]
  before_validation :generate_action_cable_uid, on: [:create]

  extend ChatoMud::Mixins::Players::Roles::Definition

  extend Devise::Models

  # Other Devise modules are: :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :lockable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :setting, dependent: :destroy

  has_many :characters, dependent: :destroy

  enum role: all_roles

  validates :email, uniqueness: true

  # \A => start of the string, \z => end of the string (including \n)
  validates :nickname, format: { with: /\A\w+\z/ }, uniqueness: true, length: { within: 3..20 }
  validates :nickname, :role, :setting, presence: true

  validate :max_one_active_character

  validates_associated :setting, :characters

  accepts_nested_attributes_for :setting

  def current_character
    characters.find_by_active(true)
  end

  def token_validation_response
    PlayerSerializer.new(self, root: false).as_json
  end

  def current_status
    return :locked if access_locked?
    return :confirmed if confirmed?

    :unconfirmed
  end

  private

  def generate_setting
    self.setting = Setting.new(ansi_coloring: true)
  end

  def generate_action_cable_uid
    self.action_cable_uid = SecureRandom.hex
  end

  def max_one_active_character
    return unless characters.select(&:active).count > 1

    errors.add(:characters, "there can be only 1 active at any given time")
  end

end
