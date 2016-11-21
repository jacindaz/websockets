Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websock cable requests in-process
  # Action Cable will be listening for WebSocket
  # requests on ws://localhost:3000/cable
  # will use the Rack socket hijacking API
  #
  # When our main app is instantiated, an instance of
  # Action Cable will also be created
  #
  # Action Cable will establish a WebSocket connection
  # on localhost:3000/cable, and begin listening
  # for socket requests on that URI
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages
end
