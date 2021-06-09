# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :github, ENV["GITHUB_CLIENT_ID"],ENV["GITHUB_CLIENT_SECRET"]
# end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '2d9899d40945e5176e1d','8ff00f7c48ae47bedc3f301194524d54116847ff'
end