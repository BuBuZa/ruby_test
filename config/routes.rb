Rails.application.routes.draw do
  get 'tournament/generate_results', to: 'tournament#generate_results'
  get 'tournament/enter_teams', to: 'tournament#enter_teams'
  post 'tournament/distribute_teams', to: 'tournament#distribute_teams'
  post 'tournament/enter_teams', to: 'tournament#create_teams'
  get 'tournament/create_teams', to: 'tournament#create_teams'

  root to: 'tournament#index'
end
