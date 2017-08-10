require 'graphql/query_resolver'

UserType = GraphQL::ObjectType.define do
  interfaces [ActiveRecordInterface]
  name "User"
  description "A user"

  field :email, types.String
  field :posts do
  	type types[PostType]
  	resolve ->(obj, args, ctx) {
  		GraphQL::QueryResolver.run(Post, ctx, PostType) do
	      obj.posts
	    end
  	}
  end
end