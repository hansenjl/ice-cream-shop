class UserController < ApplicationController

    get '/signup' do
        erb :"users/signup"
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            @error = user.errors.full_messages.join("; ")
            erb :"users/signup"
        end
    end

    get '/login' do
        erb :"users/login"
    end

    post '/login' do
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            @error = "Invalid credentials"
            erb :"users/login"
        end
    end

    get '/users/:id' do
        set_user
        erb :"users/show"
    end

    get '/logout' do
        session.clear
        redirect to '/login'
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
        redirect '/' if !@user
    end
end