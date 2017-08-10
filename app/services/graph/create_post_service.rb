module Graph
  class CreatePostService
    def initialize(inputs, ctx)
      @current_user = ctx[:current_user]
      @params = inputs
    end

    def perform!
      post = @current_user.posts.create!(id: @params[:id], title: @params[:title], content: @params[:content])
      # byebug
      {
        post: post
      }
    end
  end
end