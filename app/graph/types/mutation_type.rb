MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  description "The mutation root for this schema"

  field :createPost, field: CreatePostMutation.field
  field :createComment, field: CreateCommentMutation.field
end