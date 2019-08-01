class ArtworkSharesController < ApplicationController



    # def index
    #   artworkshares = ArtworkShare.all

    #   render json: artworkshares
    # end

    def create
      # render json: params
      artworkshare = ArtworkShare.new(artworkshare_params)
      if artworkshare.save
        render json: artworkshare
      else
        render json: artworkshare.errors.full_messages, status: 422
      end
    end 

    # def show 
    #   artworkshare = ArtworkShare.find(params[:id])

    #   render json: artworkshare
    # end

    # def update
    #   artworkshare = ArtworkShare.find(params[:id])

    #   if artworkshare.update(artworkshare_params)
    #     render json: artworkshare
    #   else
    #     render json: artworkshare.errors.full_messages, status: 422
    #   end
    # end

    def destroy
      artworkshare = ArtworkShare.find(params[:id])

      artworkshare.delete
      render json: artworkshare
    end

    private

    def artworkshare_params
      params.require(:artworkshare).permit(:artwork_id, :viewer_id)
    end
end
