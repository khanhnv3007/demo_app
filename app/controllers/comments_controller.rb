class CommentsController < ApplicationController

	def index
    @comments = Comment.all.paginate(page: params[:page], per_page: 10)
  end

	def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to :back
    else
      redirect_to :back
      flash[:danger] = "can not save!"
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "comment deleted"
    redirect_to request.referrer || root_url
  end

  private

    def comment_params
      params.require(:comment).permit(:text, :micropost_id)
    end
end
