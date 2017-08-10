module Graph
  class CreateCommentService
    def initialize(inputs, ctx)
      @current_user = ctx[:current_user]
      @params = inputs
    end

    def perform!
      post = Post.find(@params[:post_id])
      comment = post.comments.create(body: @params[:body], user: @current_user)

      {
        comment: comment
      }
    end
  end
end