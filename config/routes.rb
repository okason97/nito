Rails.application.routes.draw do
  resources :courses do
    resources :tests do
      resources :scores, only: [:index, :new, :create, :update, :destroy]
    end
    resources :enrolls, only: [:index, :update, :destroy, :create]
  end
  resources :students

  devise_for :teachers
  
  # if user authenticated then root is courses page
  authenticated :teacher do
    root 'courses#index', as: :authenticated_root
  end

  #Change default devise routes
  devise_scope :teacher do
    root to: redirect('/teachers/sign_in')
  end    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end