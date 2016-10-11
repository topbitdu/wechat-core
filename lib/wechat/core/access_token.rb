require 'jsonclient'

class Wechat::Core::AccessToken

  extend Wechat::Core::Common

  # 获取 Access Token
  # http://mp.weixin.qq.com/wiki/11/0e4b294685f817b95cbed85ba5e82b8f.html
  #
  # Return hash format if success:
  # {
  #   access_token: <ACCESS_TOKEN>,
  #   expires_in: 7200
  # }
  # The ACCESS_TOKEN is 107 characters in 2015.
  def self.load(app_id, app_secret)
    message = ::JSONClient.new.get 'https://api.weixin.qq.com/cgi-bin/token',
      {
        grant_type: 'client_credential',
        appid:      app_id,     # Rails.application.secrets.wechat_app_id,
        secret:     app_secret, # Rails.application.secrets.wechat_app_secret
      }
    message.body
  end

  # 获取 Access Token
  # http://mp.weixin.qq.com/wiki/11/0e4b294685f817b95cbed85ba5e82b8f.html
  #
  # Return hash format if success:
  # {
  #   access_token: <ACCESS_TOKEN>,
  #   expires_in: 7200
  # }
  # The ACCESS_TOKEN is 107 characters in 2015.
  def self.create(app_id, app_secret)

    assert_present! :app_id,     app_id
    assert_present! :app_secret, app_secret

    message = ::JSONClient.new.get 'https://api.weixin.qq.com/cgi-bin/token',
      {
        grant_type: 'client_credential',
        appid:      app_id,     # Rails.application.secrets.wechat_app_id,
        secret:     app_secret, # Rails.application.secrets.wechat_app_secret
      }
    message.body
  end

  class << self
    deprecate load: :create, deprecator: ActiveSupport::Deprecation.new('1.0', 'wechat-core')
  end

end
