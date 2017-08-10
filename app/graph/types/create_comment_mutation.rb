CreateCommentMutation = GraphQL::Relay::Mutation.define do
  name "CreateComment"

  input_field :body, !types.String
  input_field :post_id, !types.Int

  return_field :comment, CommentType

  resolve -> (object, inputs, ctx) {
    Graph::CreateCommentService.new(inputs, ctx).perform!
  }
end