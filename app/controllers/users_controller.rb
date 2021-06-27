class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		# render plain: "Hurrey i am working"
		render plain: User.all.map { |x| x.to_pleasant_string}.join("\n")
	end
end