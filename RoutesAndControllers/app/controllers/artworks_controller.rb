
class ArtworksController < ApplicationController


    def index
      # debugger
      # user = User.find(params[:user_id])

      # artworks = user.artworks

      # artworks = Artwork.find_by(artist_id: params[:user_id])
      # artworks = nil

      if params[:user_id]
        artworks = Artwork.joins(:shared_viewers).where("artist_id = #{params[:user_id]} or viewer_id = #{params[:user_id]}").distinct
      else
        artworks = Artwork.all
      end 
  
       render  json: artworks
      # render plain: "hello"

    end

    def create
      # render json: params
      artwork = Artwork.new(artwork_params)
      if artwork.save
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: 422
      end
    end 

    def show 
      artwork = Artwork.find(params[:id])

      render json: artwork
    end

    def update
      artwork = Artwork.find(params[:id])

      if artwork.update(artwork_params)
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: 422
      end
    end

    def destroy
      artwork = Artwork.find(params[:id])

      artwork.delete
      render json: artwork
    end

    private

    def artwork_params
      params.require(:artwork).permit(:title, :artist_id, :image_url)
    end

end
