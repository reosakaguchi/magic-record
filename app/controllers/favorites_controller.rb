class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    record = Record.find(params[:record_id])
    favoirte = current_user.favorites.new(record_id: record.id)
    favoirte.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    record = Record.find(params[:record_id])
    favoirte = current_user.favorites.find_by(record_id: record.id)
    favoirte.destroy
    redirect_to record_path(record)
  end
end
