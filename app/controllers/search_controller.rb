class SearchController < ApplicationController
  protect_from_forgery 
  
  def search 
    word = params[:word]
    @data = Streamer.free_word_search(word)
    render json: @data
  end
end
