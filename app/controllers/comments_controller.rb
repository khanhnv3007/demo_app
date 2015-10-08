class CommentsController < ApplicationController

	def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "comment created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
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
