class SubdomainConstraint
  def self.matches?(request)
    request = request
    puts request.subdomain
    request.subdomain.present? && request.subdomain != 'www' && User.pluck(:subdomain).include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  constraints subdomain: User.pluck(:subdomain) do  
      resources :projects
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end