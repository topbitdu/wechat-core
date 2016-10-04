require 'jsonclient'

class Wechat::Core::TinyLink

  extend Wechat::Core::Common

  # 长链接转短链接接口
  # http://mp.weixin.qq.com/wiki/10/165c9b15eddcfbd8699ac12b0bd89ae6.html
  #
  # Response if success:
  # {
  #   "errcode":   0,
  #   "errmsg":    "ok",
  #   "short_url": "http:\/\/w.url.cn\/s\/AvCo6Ih"
  # }
  #
  # Response if failure:
  # {
  #   "errcode": 40013,
  #   "errmsg":  "invalid appid"
  # }
  #
  def self.create(access_token, link)

    assert_present! :access_token, access_token
    #raise ArgumentError.new('The access_token argument is required.') if access_token.blank?

    message = ::JSONClient.new.post "https://api.weixin.qq.com/cgi-bin/shorturl?access_token=#{access_token}",
      {
        action:   'long2short',
        long_url: link
      }
    message.body
  end

end
