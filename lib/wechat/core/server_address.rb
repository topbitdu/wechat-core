require 'jsonclient'

class Wechat::Core::ServerAddress

  extend Wechat::Core::Common

  # 获取微信服务器IP地址
  # http://mp.weixin.qq.com/wiki/0/2ad4b6bfd29f30f71d39616c2a0fcedc.html
  #
  # Return hash format if success:
  # { ip_list: [ <IP_ADDRESS_1>, <IP_ADDRESS_2>, ... ] }
  def self.index(access_token)

    assert_present! :access_token, access_token

    #message = ::JSONClient.new.get 'https://api.weixin.qq.com/cgi-bin/getcallbackip', { access_token: access_token }
    message = get_json 'https://api.weixin.qq.com/cgi-bin/getcallbackip', body: { access_token: access_token }
    message.body
  end

end
