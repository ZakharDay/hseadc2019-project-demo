class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    post = Post.find(params[:id])
    comments = post.comments

    render json: { comments: comments }
  end

  def create
    sleep 20

    post = Post.find(params[:id])
    comment = post.comments.create!(body: params[:comment][:body])

    render json: { id: comment.id, tempId: params[:tempId] }
  end

  def update
    sleep 20
    
    comment = Comment.find(params[:id])
    comment.update_attribute(:body, params[:comment][:body])

    render json: { id: comment.id }
  end
end
