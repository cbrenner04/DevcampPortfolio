# frozen_string_literal: true
# class for guest users
class GuestUser < User
  attr_accessor :name, :first_name, :last_name, :email, :id
end
