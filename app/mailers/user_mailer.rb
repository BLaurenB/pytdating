class UserMailer < ApplicationMailer
  default from: "pytdating@gmail.com"

  def dater_requests_backer(dater, email_new_user)
    # binding.pry
    @email_new_user = email_new_user
    @requestor = dater
    @url  = "http://localhost:3000/auth/google_oauth2?requestor-dates=#{@requestor.id}"

    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @email_new_user,
                      :subject => "#{@requestor.f_name} would like to connect with you!",
                      :html    => render_to_string(template: "../views/user_mailer/dater_requests_backer.html.erb").to_str,
                      :text    => render_to_string(template: "../views/user_mailer/dater_requests_backer.text.erb").to_str
                      }
    mg_client.send_message ENV['domain'], message_params
  end

  def backer_requests_dater(backer, email_new_user)
    @email_new_user = email_new_user
    @requestor = backer
    @url  = "http://localhost:3000/auth/google_oauth2?requestor-backs=#{@requestor.id}"

    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @email_new_user,
                      :subject => "#{@requestor.f_name} would like to connect with you!",
                      :html    => render_to_string(template: "../views/user_mailer/dater_requests_backer.html.erb").to_str,
                      :text    => render_to_string(template: "../views/user_mailer/dater_requests_backer.text.erb").to_str
                      }
    mg_client.send_message ENV['domain'], message_params
  end


end
