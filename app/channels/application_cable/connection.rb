# frozen_string_literal: true

module ApplicationCable
  # user connection set for action cable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def guest_user
      guest = GuestUser.new
      guest.id = guest.object_id
      guest.name = "Guest User"
      guest.first_name = "Guest"
      guest.last_name = "User"
      guest.email = "guestuser@example.com"
      guest
    end

    def connect
      self.current_user = find_verified_user || guest_user
      logger.add_tags "ActionCable", current_user.email
      logger.add_tags "ActionCable", current_user.id
    end

    protected

    def find_verified_user
      verified_user = env["warden"].user
      return unless verified_user

      verified_user
    end
  end
end
