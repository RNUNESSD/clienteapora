Target::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get '/contato' => 'frontend/contact#new', as: :contact

  post '/contato/enviar' => 'frontend/contact#send_contact', as: :send_contact

  post '/newsletter/cadastrar' => 'frontend/home#create_newsletter', as: :create_newsletter

  get '/pagina/:slug' => 'frontend/pages#show', as: :page

  get '/conteudo/:article_category_slug' => 'frontend/articles#index', as: :articles
  get '/conteudo/:article_category_slug/:slug' => 'frontend/articles#show', as: :article

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
