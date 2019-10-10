class CommentsController < ApplicationController
  # def new
  #   @comment = Comment.new
  #   render :new
  # end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.parent_comment_id = params[:comment][:parent_comment_id] if params[:comment][:parent_comment_id]

    flash[:errors] = @comment.errors.full_messages unless @comment.save
    redirect_to post_url(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end
end
