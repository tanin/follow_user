class RelationshipsController < ApplicationController
  before_action :authorize

  def create
    current_user.active_relationships.create(followed_id: followed_user.id)
    respond_to { |format| format.js }
  end

  def destroy
    current_user.active_relationships.find(params[:id]).destroy
    followed_user
    respond_to { |format| format.js }
  end

  protected

  def followed_user
    @followed_user ||= User.find(relationship_params[:followed_id])
  end

  def relationship_params
    params.permit(:followed_id)
  end
end
