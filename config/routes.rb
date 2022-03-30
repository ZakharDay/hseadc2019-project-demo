Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      get 'posts/:id/comments', to: 'comments#index', as: 'post_comments'
      post 'posts/:id/comments/create', to: 'comments#create', as: 'create_post_comment'
      put 'comments/:id', to: 'comments#update', as: 'update_post_comment'

      get 'chats/:id/messages', to: 'chats#messages', as: 'chat_messages'
      post 'chats/:id/messages/send', to: 'chats#send_message', as: 'send_message'
    end
  end

  resources :user_chats
  resources :messages

  get 'chats/test', to: 'chats#test', as: 'chats_test'
  resources :chats

  resources :comments

  get 'posts_by_tag/:name', to: 'posts#tag', as: 'posts_by_tag'
  resources :posts

  root 'welcome#index'
end
