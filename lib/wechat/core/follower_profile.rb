require 'jsonclient'

class Wechat::Core::FollowerProfile

  extend Wechat::Core::Common

  # 批量获取用户基本信息
  # http://mp.weixin.qq.com/wiki/14/bb5031008f1494a59c6f71fa0f319c66.html#.E6.89.B9.E9.87.8F.E8.8E.B7.E5.8F.96.E7.94.A8.E6.88.B7.E5.9F.BA.E6.9C.AC.E4.BF.A1.E6.81.AF
  # 最多支持一次拉取100条。
  #
  # Return hash format if success:
  # {
  #   user_info_list: [
  #     {
  #       subscribe:      1,
  #       openid:         <OPEN_ID>,
  #       nickname:       <NICK_NAME>,
  #       sex:            <GENDER_CODE>,
  #       language:       <LANGUAGE_CODE>,
  #       city:           <CITY_NAME>,
  #       province:       <PROVINCE_NAME>,
  #       country:        <COUNTRY_NAME>,
  #       headimgurl:     <HEAD_IMAGE_LINK>,
  #       subscribe_time: <SUBSCRIBE_TIME>,
  #       unionid:        <UNION_ID>, 
  #       remark:         <REMARK>,
  #       groupid:        <GROUP_ID>
  #     }
  #   ]
  # }
  def self.index(access_token, open_ids, language: Wechat::Core::Common::LANGUAGE_SIMPLIFIED_CHINESE)

    assert_present! :access_token, access_token
    assert_present! :open_ids, open_ids

    followers = open_ids.map { |open_id| { openid: open_id, lang: language } }
    #message = ::JSONClient.new.post "https://api.weixin.qq.com/cgi-bin/user/info/batchget?access_token=#{access_token}", { user_list: followers }
    message = post_json "https://api.weixin.qq.com/cgi-bin/user/info/batchget?access_token=#{access_token}", body: { user_list: followers }
    message.body

  end

  # 获取用户基本信息(UnionID机制)
  # http://mp.weixin.qq.com/wiki/14/bb5031008f1494a59c6f71fa0f319c66.html#.E8.8E.B7.E5.8F.96.E7.94.A8.E6.88.B7.E5.9F.BA.E6.9C.AC.E4.BF.A1.E6.81.AF.EF.BC.88.E5.8C.85.E6.8B.ACUnionID.E6.9C.BA.E5.88.B6.EF.BC.89
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
  def self.load(access_token, open_id, language: 'zh_CN')

    assert_present! :access_token, access_token
    assert_present! :open_id, open_id

    message = get_json 'https://api.weixin.qq.com/cgi-bin/user/info', body:
      {
        access_token: access_token,
        openid:       open_id,
        lang:         language
      }
    message.body
  end

end
