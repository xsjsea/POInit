json.extract! social_account, :id, :creator_id, :phone, :mobile, :qq, :wechat, :email, :skype, :google, :yahoo, :created_at, :updated_at
json.url social_account_url(social_account, format: :json)
