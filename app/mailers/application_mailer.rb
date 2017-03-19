# frozen_string_literal: true
# mailer superclass
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end
