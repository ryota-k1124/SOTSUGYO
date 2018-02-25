class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_menu.subject
  #
  def sendmail_menu(menu)
    @menu = menu
    
    @greeting = "Hi"

    mail to: "rank0724@hotmail.co.jp",subject: "画像が投稿されました"
  end
end
