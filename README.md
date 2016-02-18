# Wechat::Core 微信核心库

[![License](https://img.shields.io/badge/license-MIT-green.svg)](http://opensource.org/licenses/MIT)
[![Gem Version](https://badge.fury.io/rb/wechat-core.svg)](https://badge.fury.io/rb/wechat-core)

The Wechat Core Library is a code base to call the core Wechat APIs, such as fetching Access Token, and fetching Follower Profile. 微信核心库用于调用微信核心API，例如获取访问令牌，获取关注者的信息。

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

Get the [Wechat Access Token](http://mp.weixin.qq.com/wiki/14/9f9c82c1af308e3b14ba9b973f99a8ba.html)
```ruby
response = ::Wechat::Core::AccessToken.load Rails.application.secrets.wechat_app_id, Rails.application.secrets.wechat_app_secret
if response.present?
  access_token = response['access_token']
  expires_in   = response['expires_in']
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/topbitdu/wechat-core. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

