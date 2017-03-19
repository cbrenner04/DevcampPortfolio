# frozen_string_literal: true
# model superclass
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
