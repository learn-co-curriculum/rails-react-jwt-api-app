class MoviesController < ApplicationController
  before_action :authenticate_token!

  def index 
    render json: Movie.all
  end

end
