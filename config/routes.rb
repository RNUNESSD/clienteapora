Target::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  get '/contato' => 'frontend/contact#new', as: :contact

  post '/contato/enviar' => 'frontend/contact#send_contact', as: :send_contact

  post '/newsletter/cadastrar' => 'frontend/home#create_newsletter', as: :create_newsletter

  get '/pagina/:slug' => 'frontend/pages#show', as: :page

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  devise_for :user, path: 'admin'
  namespace :admin do
    resources :pages, :newsletters, :links, :users, :roles, :permissions, :localizations, :phones, :social_networks

    get 'edit_password', to: 'users#edit_password',  as: :edit_password
    patch 'update_password', to: 'users#update_password',  as: :update_password

    resources :article_categories do
      resources :articles do
        resources :images do
          collection do
            post :update_position
          end
        end
      end
    end

    resources :email_categories do
      resources :email_contacts
    end

    resources :banner_categories do
      resources :banners do
        collection do
          post :update_position
        end
      end
    end

    resources :pages do
      resources :page_images do
        collection do
          post :update_position
        end
      end
    end

    root to: 'dashboard#index'
  end

  root to: 'frontend/home#index'
end
