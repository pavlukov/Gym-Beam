class CommentsController < ApplicationController
  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_user.id, body)
    authorize @comment

    respond_to do |format|
      if @comment.save
        make_child_comment
        format.html  { redirect_back(fallback_location: sport_sections_url, :notice => 'Comment was successfully added.') }
      else
        format.html  { render :action => "new" }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id, :redirect_url)
  end

  def commentable_type
    comment_params[:commentable_type]
  end

  def commentable_id
    comment_params[:commentable_id]
  end

  def comment_id
    comment_params[:comment_id]
  end

  def body
    comment_params[:body]
  end

  def make_child_comment
    return "" if comment_id.blank?

    parent_comment = Comment.find comment_id
    if parent_comment.parent_id.nil?
      @comment.move_to_child_of(parent_comment)
    else
      parent_comment = Comment.find parent_comment.parent_id
      @comment.move_to_child_of(parent_comment)
    end
  end
end
