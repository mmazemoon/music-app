Rails.application.routes.draw do
  resource :users
  resource :session, only:[:create, :new, :destroy]
end
