Target::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get '/contato' => 'frontend/contact#new', as: :contact

  post '/contato/enviar' => 'frontend/contact#send_contact', as: :send_contact

  post '/newsletter/cadastrar' => 'frontend/home#create_newsletter', as: :create_newsletter

  get '/conteudo/:slug' => 'frontend/pages#show', as: :page

  get '/noticias' => 'frontend/articles#index', as: :notices

  get '/noticias/:slug' => 'frontend/articles#show', as: :notice

  devise_for :user, path: 'admin'
  namespace :admin do
    resources :pages, :newsletters, :links, :banners, :banner_categories, :users, :roles, :permissions
    resources :article_categories do
      resources :articles
    end

    root to: 'dashboard#index'
  end

  root to: 'frontend/home#index'
end
