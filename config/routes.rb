Rails.application.routes.draw do
  root to: "time_tables#new"

  resources :time_tables do
  	resources :timetable_subjects
  end

  resources :slots
  resources :subjects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
