class UsersController < ApplicationController
    def new
    end
  
    def new_post
      puts params
      user = User.new
      user.username = params["username"]
      user.bio = params["bio"]
      user.save
      if user.username.include?(" ")
        redirect_to "/error2"
      elsif user.id != nil
        redirect_to "/users/#{User.last.username}"
      else
        redirect_to "/error"
      end
    end
  
    def show
      @username = params[:username]
      @id = User.find_by(username: @username).id
      @bio = User.find_by(username: @username).bio
    end
  
    def error
    end
  end
  