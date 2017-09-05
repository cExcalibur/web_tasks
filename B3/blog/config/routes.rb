Rails.application.routes.draw do
  namespace :front do
    get"frontend/index" => "frontend#index"
    get"frontend/index/:id" => "frontend#index"
    get"frontend/post/:id" => "frontend#post"
    post"frontend/comment" => "frontend#comment"
    get"frontend/feedback" => "frontend#feedback"
    post"frontend/submitfeedback" => "frontend#submitfeedback"
  end

  namespace :admin do
    get "backend/signup" => "backend#signup"
    get "backend/login" => "backend#login"
    post "backend/register" => "backend#register"
    post "backend/confirm" => "backend#confirm"
    get "backend/index" => "backend#index"
    get "backend/signout" => "backend#signout"
    get "backend/posts" => "backend#posts"
    get "comments/:id" => "comments#index"
    post "comments/pass/:id" => "comments#pass"
    get "feedbacks" => "feedbacks#index"
    resources :comments
    resources :posts


  end

  root "front/frontend#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
