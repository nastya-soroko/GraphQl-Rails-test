CommentType = GraphQL::ObjectType.define do
  interfaces [ActiveRecordInterface]
  name "Comment"
  description "A Comment"

  field :body, types.String
  field :post do
    type PostType
    resolve ->(obj, args, ctx) {
      obj.post
    }
  end
  field :user do
    type UserType
    resolve ->(obj, args, ctx) {
      obj.user
    }
  end
end