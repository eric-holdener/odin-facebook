json.extract! friendship, :id, :user_id, :friend_id, :status, :create, :destroy, :created_at, :updated_at
json.url friendship_url(friendship, format: :json)
