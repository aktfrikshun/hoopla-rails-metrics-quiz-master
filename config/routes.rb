Rails.application.routes.draw do

  root to: 'metrics#index'

  get 'metrics/index'

  get 'metrics/show'

end
