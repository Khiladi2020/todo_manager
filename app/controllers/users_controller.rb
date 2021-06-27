class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: "Hurrey i am working"
    render plain: User.all.map { |x| x.to_pleasant_string }.join("\n")
  end

  def create
    names = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: names, email: email, password: password)
    new_user.save!
    render plain: "new user created with id: #{new_user.id}"
  end

  def login
    email = params[:email]
    password = params[:password]
    found_user = User.where(email: email, password: password)
    response_text = (found_user.count == 0) ? false : true
    render plain: response_text
  end
end
