class FeedbacksMailer < ApplicationMailer

  default to: %{"TestGuru" <admintestguru@testguru.com>}

  def send_message(feedbacks)
    @name = feedbacks.name
    @email = feedbacks.email
    @message = feedbacks.message


    mail from: @email
  end
end
