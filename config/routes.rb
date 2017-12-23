Rails.application.routes.draw do
 
  devise_for :teachers
  # if user authenticated then root is courses page
  authenticated :teacher do
    root 'courses#index', as: :authenticated_root
    resources :courses do
      resources :tests, only: [:index, :new, :create, :edit, :update, :destroy] do
        resources :scores, only: [:index, :create, :update, :destroy]
      end
      resources :enrolls, only: [:index, :update, :destroy, :create]
    end
    resources :students
  
  end

  #Change default devise routes
  devise_scope :teacher do
    get '*path' => redirect('/teachers/sign_in')
  end    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end