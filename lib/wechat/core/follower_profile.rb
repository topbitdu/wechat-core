require 'jsonclient'

class Wechat::Core::FollowerProfile

  # 批量获取用户基本信息
  # http://mp.weixin.qq.com/wiki/14/bb5031008f1494a59c6f71fa0f319c66.html
  # 最多支持一次拉取100条。
  #
  # Return hash format if success:
  # {
  #   subscribe:      1,
  #   openid:         <OPEN_ID>,
  #   nickname:       <NICK_NAME>,
  #   sex:            <GENDER_CODE>,
  #   language:       <LANGUAGE_CODE>,
  #   city:           <CITY_NAME>,
  #   province:       <PROVINCE_NAME>,
  #   country:        <COUNTRY_NAME>,
  #   headimgurl:     <HEAD_IMAGE_LINK>,
  #   subscribe_time: <SUBSCRIBE_TIME>,
  #   remark:         <REMARK>,
  #   groupid:        <GROUP_ID>
  # }
  def self.index(access_token, open_ids, language = 'zh_CN')
    followers = open_ids.map { |open_id| { openid: open_id, lang: language } }
    message = ::JSONClient.new.post "https://api.weixin.qq.com/cgi-bin/user/info/batchget?access_token=#{access_token}", { user_list: followers }
    message.body
  end

  # 获取用户基本信息(UnionID机制)
  # http://mp.weixin.qq.com/wiki/14/bb5031008f1494a59c6f71fa0f319c66.html
  # 一次拉取调用最多拉取10000个关注者的OpenID，可以通过多次拉取的方式来满足需求。 
  #
  # Return hash format if success:
  # {
  #   subscribe:      1,
  #   openid:         <OPEN_ID>,
  #   nickname:       <NICK_NAME>,
  #   sex:            <GENDER_CODE>,
  #   language:       <LANGUAGE_CODE>,
  #   city:           <CITY_NAME>,
  #   province:       <PROVINCE_NAME>,
  #   country:        <COUNTRY_NAME>,
  #   headimgurl:     <HEAD_IMAGE_LINK>,
  #   subscribe_time: <SUBSCRIBE_TIME>,
  #   remark:         <REMARK>,
  #   groupid:        <GROUP_ID>
  # }
  def self.load(access_token, open_id, language = 'zh_CN')
    message = ::JSONClient.new.get 'https://api.weixin.qq.com/cgi-bin/user/info',
      {
        access_token: access_token,
        openid:       open_id,
        lang:         language
      }
    message.body
  end

end
