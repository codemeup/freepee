class LoosController < ApplicationController
  def index
    @loos = Loo.all
  end

  def new
    @loo = Loo.new
  end

  def show
    @loo = Loo.find_by_id(params[:id])
  end

  def create
    loo = Loo.create(loo_params)
    redirect_to loo_path(loo)
  end

  def foursquare_results
    lat = foursquare_params[:lat]
    lon = foursquare_params[:lon]
    # redirect_to loos_path
    @loos = Loo.foursquare(lat,lon)
    render :index
  end

  def add_comment
    loo = Loo.find_by_id(params[:id])
    rating = loo.ratings.create(rating_params)
    redirect_to :back
    # rating_info = "##{rating.id.to_s}"
    # redirect_to loo_path(loo,"#{rating_info}")
  end

  private

  def foursquare_params
    params.require(:fs_data).permit(:lat, :lon)
  end

  def loo_params
    params.require(:loo).permit(:name, :address)
  end

  def rating_params
    params.require(:rating).permit(:score, :comment)
  end
end