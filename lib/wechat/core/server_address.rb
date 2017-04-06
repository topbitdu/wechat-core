##
# Server Address 是服务器地址的远程调用封装类。

class Wechat::Core::ServerAddress

  extend Wechat::Core::Common

  ##
  # 获取微信服务器IP地址
  # http://mp.weixin.qq.com/wiki/0/2ad4b6bfd29f30f71d39616c2a0fcedc.html
  #
  # Return hash format if success:
  # { ip_list: [ <IP_ADDRESS_1>, <IP_ADDRESS_2>, ... ] }
  def self.index(access_token)

    assert_present! :access_token, access_token

    get_json 'https://api.weixin.qq.com/cgi-bin/getcallbackip', body: { access_token: access_token }

  end

end
