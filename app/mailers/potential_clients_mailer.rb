class PotentialClientsMailer < ApplicationMailer
  default from: 'easter3000@gmail.com'

  def welcome_email
    @potential_client = params[:potential_client]
    # @url = 'http://localhost:3000/login'
    mail(to: @potential_client.email, subject: 'Lorem ipsum')
  end
end
