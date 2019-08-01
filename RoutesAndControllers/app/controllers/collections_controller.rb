class CollectionsController < ApplicationController

  def index

    if params[:name] && params[:user_id]
      debugger
        collections = Artwork.joins(:collections).where("collections.name = '#{params[:name]}'").where("collections.user_id = #{params[:user_id]}")
    elsif params[:user_id]
        collections = Collection.where(user_id: params[:user_id]).select(:name).distinct
      else
        collections = collection.all
      end 
  
       render json: collections
    end

    def create
      collection = Collection.new(collection_params)
      if collection.save
        render json: collection
      else
        render json: collection.errors.full_messages, status: 422
      end
    end 

    def show 
      
    end

    def update
      collection = Collection.find(params[:id])

      if collection.update(collection_params)
        render json: collection
      else
        render json: collection.errors.full_messages, status: 422
      end
    end

    def destroy
      collection = Collection.find(params[:id])

      collection.delete
      render json: collection
    end

    private

    def collection_params
      params.require(:collection).permit(:user_id, :name, :artwork_id)
    end

end
