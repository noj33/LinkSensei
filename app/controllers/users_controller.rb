class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @containers = @user.containers.order(created_at: :desc).reject{|c| c.staging?}
    @containers = @containers.paginate(:page => params[:page], :per_page => 10)
    @staging = @user.containers.select{|c| c.staging?}
    @link = Link.new
  end
  def index
    @users = User.all
  end
end
