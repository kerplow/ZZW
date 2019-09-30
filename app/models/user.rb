class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, uniqueness: { scope: [:first_name, :last_name] }
  validates :email, uniqueness: true
  validates_uniqueness_of :phone_number

  enum house_status: [:guest, :housemate, :subrenter, :old_mate]

  validates_presence_of :first_name

  has_many :debtors, through: :debts, source: :debtor
  has_many :debts, foreign_key:  'from_id', class_name: 'Debt'

  has_many :inners, through: :innings, source: :inner
  has_many :innings, foreign_key: 'to_id', class_name: 'Debt'

  has_many :notes

  belongs_to :room, optional: true

  validate :room_check

  def room_check
    case house_status
    when :housemate
      validates_presence_of :room
    when :subrenter
      validates_presence_of :room
    else
      errors.add(:guest, "guests have no room") unless room.blank?
    end
  end
end
