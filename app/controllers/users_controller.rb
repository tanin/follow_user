class UsersController < ApplicationController
  before_action :authorize

  def index
    @users ||= User.includes(:group).all
  end
end
