# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <admintestguru@testguru.com>)
  layout 'mailer'
end
