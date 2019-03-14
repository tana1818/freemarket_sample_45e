class CommentsController < ApplicationController

    def new
    end

    def create
      @comment = Comment.create(comment_params)
      # binding.pry
      redirect_to product_path(@comment.product_id)
    end

    private
    def comment_params
      params.require(:comment).permit(:comment).merge(user_id: 2, product_id:params[:product_id])
    end
end
