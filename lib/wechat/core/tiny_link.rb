require 'jsonclient'

class Wechat::Core::TinyLink

  # 长链接转短链接接口
  # http://mp.weixin.qq.com/wiki/10/165c9b15eddcfbd8699ac12b0bd89ae6.html
  def self.create(access_token, link)
    message = ::JSONClient.new.post "https://api.weixin.qq.com/cgi-bin/shorturl?access_token=#{access_token}",
      {
        action:   'long2short',
        long_url: link
      }
    message.body
  end

end
