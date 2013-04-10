# All routes entered here will automatically be pulled in Foreman
Rails.application.routes.draw do

  # Needed to make the hosts/edit form render
  match 'architecture_selected_discovered' => 'hosts#architecture_selected'
  match 'os_selected_discovered'           => 'hosts#os_selected'
  match 'medium_selected_discovered'       => 'hosts#medium_selected'

  constraints(:id => /[^\/]+/) do
    resources :discovered do
      member do
        get 'refresh_facts'
      end
      collection do
        get 'multiple_destroy'
        post 'submit_multiple_destroy'
        get  'select_multiple_organization'
        post 'update_multiple_organization'
        get  'select_multiple_location'
        post 'update_multiple_location'
      end
    end
  end

end
