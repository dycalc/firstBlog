class CommentsController < ApplicationController
  def create
    #不加下面这行会报错，会提示：ActiveModel::ForbiddenAttributesError。详情见：https://ruby-china.org/topics/8979
    params.permit!
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    redirect_to @post if @comment.save
  end
end
