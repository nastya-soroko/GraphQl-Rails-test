Rails.application.routes.draw do
  root "pages#root"

  post "graphql" => "graphqls#create"

  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"

  # Clearance default routes generated by `rails generate clearance:routes`
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
end