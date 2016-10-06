require 'jsonclient'

class Wechat::Core::Follower

  extend Wechat::Core::Common

  # 获取关注者列表
  # http://mp.weixin.qq.com/wiki/0/d0e07720fc711c02a3eab6ec33054804.html
  #
  # Return hash format if success:
  # {
  #   total: <TOTAL>,
  #   count: <COUNT>,
  #   data: { openid: [ <OPEN_ID_1>, <OPEN_ID_2>, ... ] },
  #   next_openid: <NEXT_OPEN_ID>
  # }
  def self.index(access_token, next_open_id: nil)

    assert_present! :access_token, access_token

    options = { access_token: access_token }
    options[:next_openid] = next_open_id if next_open_id.present?

    message = ::JSONClient.new.get 'https://api.weixin.qq.com/cgi-bin/user/get', options
    message.body
  end

end
