class PhotosController < ApplicationController
    
    def index
        public_parameters
        user_id = ENV['FLICKR_USER_ID']
        begin
            collections = flickr.collections.getTree(:user_id => user_id)
            right_collection = !collections.respond_to?("collections") ? collections.select {|k| k.title == @sector.name}.first : nil
            photosets = right_collection.nil? ? [] : right_collection.set
            @albums = Array.new
            photosets.each_with_index do |p, i|
                @albums.push(Hash.new)
                @albums[i][:id] = p.id
                @albums[i][:title] = p.title
                set_info = flickr.photosets.getInfo(:photoset_id => p.id)
                @albums[i][:cover] = 'https://farm' + set_info.farm.to_s + '.staticflickr.com/' + set_info.server.to_s + 
                    '/' + set_info.primary.to_s + '_' + set_info.secret.to_s + '_q.jpg'
                @albums[i][:photo_count] = set_info.count_photos
                @albums[i][:date] = set_info.date_create

                # ALTRO METODO (più lento?)
                # photos = flickr.photosets.getPhotos(:photoset_id => p.id, :extras => 'url_s').photo
                # primary_url = photos.select {|photo| photo.isprimary == "1"}[0].url_s
                # logger.debug(primary_url.inspect)
                # @albums[i][:cover] = primary_url
            end
            @albums = @albums.paginate(page: params[:page], per_page: 12)
        rescue FlickRaw::FailedResponse => e
            not_found
        end
    end

    def show
        public_parameters
        begin
            album = flickr.photosets.getPhotos(:photoset_id => params[:id])
            logger.debug(album.inspect)
            @album_title = album.title
            photos = album.photo
            @photos = Array.new
            photos.each_with_index do |p, i|
                @photos.push(Hash.new)
                base_url = 'https://farm' + p.farm.to_s + '.staticflickr.com/' + p.server.to_s + 
                    '/' + p.id.to_s + '_' + p.secret.to_s
                @photos[i][:small] = base_url + '_q.jpg'
                @photos[i][:normal] = base_url + '_b.jpg'
            end
            @photos = @photos.paginate(page: params[:page], per_page: 50)
        rescue FlickRaw::FailedResponse => e
            not_found
        end
    end

end
