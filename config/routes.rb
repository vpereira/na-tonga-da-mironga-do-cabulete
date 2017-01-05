Rails.application.routes.draw do
  resources :codestreams, param: :name do
    resources :packages, param: :name do
      # regexp to match /my/dir/file.extension
      # ActiveSupport removes extensions
      resources :package_files, param: :path, constraints: { path: /.*?\..*/}
    end
  end
  root 'codestreams#index'
end
