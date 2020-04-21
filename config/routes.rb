# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    get 'chromedriver_version', to: 'chromedriver_version#show', json: true
  end
end
