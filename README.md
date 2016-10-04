# Wechat::Core 微信核心库

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/wechat-core.svg)](https://badge.fury.io/rb/wechat-core)
[![Dependency Status](https://gemnasium.com/badges/github.com/topbitdu/wechat-core.svg)](https://gemnasium.com/github.com/topbitdu/wechat-core)

The Wechat Core Library is a code base to call the core Wechat APIs, such as fetching Access Token, and fetching Follower Profile. 微信核心库用于调用微信核心API，例如获取访问令牌，获取关注者的信息。

## Recent Update
Check out the [Road Map](ROADMAP.md) to find out what's the next.
Check out the [Change Log](CHANGELOG.md) to find out what's new.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wechat-core'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wechat-core

## Usage



### Access Token 访问令牌

[Get the Wechat Access Token 获取微信访问令牌](http://mp.weixin.qq.com/wiki/14/9f9c82c1af308e3b14ba9b973f99a8ba.html)
```ruby
response = Wechat::Core::AccessToken.load Rails.application.secrets.wechat_app_id, Rails.application.secrets.wechat_app_secret
if response.present?
  access_token = response['access_token']
  expires_in   = response['expires_in']
end
```



### Follower 关注者

[Get the Follower List 获取关注者列表](http://mp.weixin.qq.com/wiki/0/d0e07720fc711c02a3eab6ec33054804.html)
```ruby
response = Wechat::Core::Follower.index access_token
if response.present? && 0==response['errcode'].to_i
  total        = response['total']
  count        = response['count']
  next_open_id = response['next_openid']
  data         = response['data']
  data['openid'].each do |open_id|
    # Show open_id
  end
else
  # Show response['errmsg']
end
```

[Get the Follower List with Pagination 分页获取关注者列表](http://mp.weixin.qq.com/wiki/0/d0e07720fc711c02a3eab6ec33054804.html)
```ruby
response = Wechat::Core::Follower.index access_token, next_open_id
if response.present? && 0==response['errcode'].to_i
  total        = response['total']
  count        = response['count']
  next_open_id = response['next_openid']
  data         = response['data']
  data['openid'].each do |open_id|
    # Show open_id
  end
else
  # Show response['errmsg']
end
```

[Get the Follower Profiles by Batch 批量获取关注者轮廓](http://mp.weixin.qq.com/wiki/14/bb5031008f1494a59c6f71fa0f319c66.html#.E6.89.B9.E9.87.8F.E8.8E.B7.E5.8F.96.E7.94.A8.E6.88.B7.E5.9F.BA.E6.9C.AC.E4.BF.A1.E6.81.AF)
```ruby
response = Wechat::Core::FollowerProfile.index access_token, [ open_id_1, open_id_2, ... ]
if response.present? && 0==response['errcode'].to_i
  response['user_info_list'].each do |profile|
    subscribed     = profile['subscribe']
    open_id        = profile['openid']
    nick_name      = profile['nickname']
    sex            = profile['sex']
    language       = profile['language']
    city           = profile['city']
    province       = profile['province']
    country        = profile['country']
    portrait_link  = profile['headimgurl']
    subscribe_time = profile['subscribe_time']
    union_id       = profile['unionid']
    remark         = profile['remark']
    group_id       = profile['groupid']
  end
else
  # Show response['errmsg']
end
```

[Get the Follower Profile 获取用户基本信息](http://mp.weixin.qq.com/wiki/14/bb5031008f1494a59c6f71fa0f319c66.html#.E8.8E.B7.E5.8F.96.E7.94.A8.E6.88.B7.E5.9F.BA.E6.9C.AC.E4.BF.A1.E6.81.AF.EF.BC.88.E5.8C.85.E6.8B.ACUnionID.E6.9C.BA.E5.88.B6.EF.BC.89)
```ruby
response = Wechat::Core::FollowerProfile.load access_token, open_id
if response.present? && 0==response['errcode'].to_i
  subscribed     = response['subscribe']
  open_id        = response['openid']
  nick_name      = response['nickname']
  sex            = response['sex']
  language       = response['language']
  city           = response['city']
  province       = response['province']
  country        = response['country']
  portrait_link  = response['headimgurl']
  subscribe_time = response['subscribe_time']
  union_id       = response['unionid']
  remark         = response['remark']
  group_id       = response['groupid']
else
  # Show response['errmsg']
end
```



### Server Address 服务器地址

[Get Server Addresses 获取服务器地址](http://mp.weixin.qq.com/wiki/0/2ad4b6bfd29f30f71d39616c2a0fcedc.html)
```ruby
response = Wechat::Core::ServerAddress.index access_token
if response.present? && 0==response['errcode'].to_i
  response['ip_list'].each do |ip_address|
    # Do something with the IP Address...
  end
else
  # Show response['errmsg']
end
```



### Tiny Link 短链接

[Generate Tiny Link 长链接转短链接接口](http://mp.weixin.qq.com/wiki/10/165c9b15eddcfbd8699ac12b0bd89ae6.html)
```ruby
response = Wechat::Core::TinyLink.create access_token, 'http://product.company.com/promotion/page.html'
if response.present? && 0==response['errcode'].to_i
  tiny_link = response['short_url']
else
  # Show response['errmsg']
end
```



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/topbitdu/wechat-core. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

