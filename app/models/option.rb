class Option < ApplicationRecord
  include Tradeable
  acts_as_votable

  belongs_to :user
  belongs_to :list

  validates :name, presence: true, uniqueness: { scope: :list }
  serialize :voters, Array

  def allow_anonymous?
    list.allow_anonymous?
  end
end
