require 'graphql/query_resolver'

PostType = GraphQL::ObjectType.define do
  interfaces [ActiveRecordInterface]
  name "Post"
  description "A post"

  field :title, types.String
  field :content, types.String
  field :user do
    type UserType
    resolve ->(obj, args, ctx) {
      obj.user
    }
  end
  field :comments do
    type types[CommentType]
    resolve ->(obj, args, ctx) {
      GraphQL::QueryResolver.run(Comment, ctx, CommentType) do
        obj.comments
      end
    }
  end
  field :errors, types[types.String], "Reasons the object couldn't be created or updated" do
    resolve ->(obj, args, ctx) { obj.errors.full_messages }
  end
end