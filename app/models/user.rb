# frozen_string_literal: true
# no doc
class User < ApplicationRecord
  petergate(roles: [:admin], multiple: false)

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end
end
