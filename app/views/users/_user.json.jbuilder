json.extract! user, :id, :name, :email, :password, :phone, :chk_box, :created_at, :updated_at
json.url user_url(user, format: :json)