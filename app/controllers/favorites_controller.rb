class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @record  = Record.find(params[:record_id])
    favoirte = current_user.favorites.new(record_id: @record.id)
    favoirte.save
  end
  
  def destroy
    @record  = Record.find(params[:record_id])
    favoirte = current_user.favorites.find_by(record_id: @record.id)
    favoirte.destroy
  end
end
