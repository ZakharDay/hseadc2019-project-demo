Rails.application.routes.draw do
  resources :user_chats
  resources :messages
  resources :chats
  namespace :api do
    namespace :v1 do
      get 'posts/:id/comments', to: 'comments#index', as: 'post_comments'
      post 'posts/:id/comments/create', to: 'comments#create', as: 'create_post_comment'
      put 'comments/:id', to: 'comments#update', as: 'update_post_comment'
    end
  end

  resources :comments
  resources :posts
  root 'posts#index'
end
