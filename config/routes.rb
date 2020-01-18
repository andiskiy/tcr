# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#show'
  get '/', to: 'dashboard#show'
end
