Rails.application.routes.draw do
  resources :posts, path:'news' do
    resources :comments
  end
end
