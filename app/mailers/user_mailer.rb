class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_post_email(user, group, recipients)
    @user = user
    @group = group
    @url = 'http://localhost:3000/sign_in'
    mail(bcc: recipients.map(&:email), subject: "New Post in Group #{@group.name}")
  end
end
