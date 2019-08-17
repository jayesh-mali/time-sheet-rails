class UsersController < ApplicationController
    def index
        @users = User.all
        render @users, status: :ok
    end
end
