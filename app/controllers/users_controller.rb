class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_lists = @user.lists.paginate(page: params[:page], per_page: 5)
  end
end
