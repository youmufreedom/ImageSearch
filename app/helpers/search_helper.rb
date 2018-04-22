module SearchHelper

  def link_to_image(photo)
    url = 'https://farm' + photo.farm.to_s + '.staticflickr.com/' + photo.server.to_s + '/' + photo.id.to_s + '_' + photo.secret + '.jpg'
    link_to image_tag(url), photo.url
  end
end