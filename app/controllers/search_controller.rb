class SearchController < ApplicationController
  def index
    if params[:page].present?
      page = params[:page]
    else
      page = 1
    end
    begin
      @photos = Flickr.photos.search(text: params[:search], page: page, per_page: 10)
    rescue
      redirect_to :root, :flash => { :error => "Something wrong, please try it again" }
    end
  end
end