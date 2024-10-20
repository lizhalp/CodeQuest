json.extract! content, :id, :user_id, :title, :content_text, :created_at, :updated_at
json.url content_url(content, format: :json)
