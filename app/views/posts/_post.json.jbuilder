json.extract! post, :id, :title, :user_id, :summary, :content, :feeling, :created_at, :updated_at
json.url post_url(post, format: :json)
