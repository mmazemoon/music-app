Rails.application.routes.draw do
  resource :users, only: [:create, :new, :show]
  resource :session, only:[:create, :new, :destroy]
end
