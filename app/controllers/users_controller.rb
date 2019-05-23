class UsersController < ApplicationController
  before_action :authorize

  def index
    @active_relationships ||= current_user.active_relationships
    @users ||= User.includes(:group, :followers)
  end
end
