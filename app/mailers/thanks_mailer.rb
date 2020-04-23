class ThanksMailer < ApplicationMailer
  default from: 'hiroshimazeal@yahoo.co.jp'

  def thanks_mail(user)
    @user = user
    mail(subject: "新規登録完了のご連絡", to: @user.email)
  end
end
