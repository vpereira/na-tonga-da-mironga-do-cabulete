json.extract! package_file, :id, :path, :content, :package_id, :created_at, :updated_at
json.url package_file_url(package_file, format: :json)