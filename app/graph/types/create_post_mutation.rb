CreatePostMutation = GraphQL::Relay::Mutation.define do
  name "CreatePost"

  input_field :title, !types.String
  input_field :content, types.String
  input_field :id, types.Int

  return_field :post, PostType
  resolve RescueFrom.new(-> (obj, inputs, ctx) {
  	Graph::CreatePostService.new(inputs, ctx).perform!
  })
  # resolve -> (object, inputs, ctx) {
  #   Graph::CreatePostService.new(inputs, ctx).perform!
  # }
end