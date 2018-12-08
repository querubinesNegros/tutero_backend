class RegistroMailer < ApplicationMailer

  def confirmacionRegistro(user)
    @user = user
    mail to: @user.email, subject: 'Confirmacion registro - TuteroApp'
  end

end
