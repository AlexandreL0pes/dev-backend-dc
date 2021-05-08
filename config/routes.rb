Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace 'api' do 
    namespace 'v1' do 
      get 'status', to: 'orders#status'

      resources :orders, only: [:create] do
        collection do 
          get :status
        end
      end
    end
  end
end
