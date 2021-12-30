# Below are the routes for madmin
namespace :madmin do
  resources :bookings
  resources :residents
  resources :slots
  resources :day_offs
  resources :nurses
  resources :centers
  namespace :active_storage do
    resources :blobs
  end
  namespace :active_storage do
    resources :attachments
  end
  resources :users
  namespace :active_storage do
    resources :variant_records
  end
  resources :services
  resources :announcements
  root to: 'dashboard#show'
end
