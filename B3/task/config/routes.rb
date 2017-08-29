Rails.application.routes.draw do
  get "backend/signup" => "backend#signup"
  post "backend/confirm" => "backend#confirm"
  get "backend/index" => "backend#index"
  get "backend/signout" => "backend#signout"
  get "backend/posts" => "backend#posts"
  get "comments/:id" => "comments#index"
  post "comments/pass/:id" => "comments#pass"
  get "feedbacks" => "feedbacks#index"
  resources :comments
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
