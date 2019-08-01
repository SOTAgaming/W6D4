class LikesController < ApplicationController

    def index
      # debugger
      if params[:user_id]
        likes = Like.where("user_id = #{params[:user_id]}") 
      elsif params[:artwork_id]
        likes = Like.where("like_id = #{params[:artwork_id]}").where(like_type: "artwork")
      elsif params[:comment_id] 
        likes = Like.where("like_id = #{params[:comment_id]}").where(like_type: "comment")
      else
        likes = Like.all
      end 
      render json: likes 
    end


     def create

      like = Like.new(like_params)
      if like.save
        render json: like
      else
        render json: like.errors.full_messages, status: 422
      end
    end 


  def destroy
      like = Like.find(params[:id])

      like.delete
      render json: like
    end

    private

    def like_params
      params.require(:like).permit(:like_type, :like_id, :user_id)
    end

end
