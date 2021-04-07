Rails.application.routes.draw do
  get 'appointments/new'
  root 'static_pages#home'
  devise_for :users,controllers: { registrations: 'users/registrations' }
  
  
  resources :users, except: [:destroy,:new]
  resources :appointments
  get '/doctors', to:'users#show_doctors'
  get '/show_appointments', to:'users#show_appointments'
  get '/appointment_status', to:'users#status_mail'
  post '/add_note', to:'users#add_note'
  
 
    
  #get '/logout',to:'users/sessions#delete'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
