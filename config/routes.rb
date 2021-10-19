class BlacklistConstraint
  def initialize
    @ips = ['127.0.0.1']
  end

  def matches?(request)
    @ips.include?(request.remote_ip)
  end
end

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "/graphql", to: "graphql#execute"
  root 'articles#index'
  resources :articles, shallow: true do
    resources :comments
    collection do
      get 'preview'
    end
  end
  get '*path', to: 'blacklists#index', constraints: BlacklistConstraint.new
end
