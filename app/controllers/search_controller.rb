class SearchController < ApplicationController
  def index
    if params[:search].present?
      if params[:page].present?
        page = params[:page]
      else
        page = 1
      end

      begin
        @photos = Flickr.photos.search(text: params[:search], tags: params[:search], page: page, per_page: 10)
        p @photos.count
      rescue
        redirect_to :root, :flash => { :error => "Something wrong, please try it again" }
      end
    else
      redirect_to :root, :flash => { :error => "You must enter at least one character" }
    end
  end
end