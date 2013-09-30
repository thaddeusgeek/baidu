# Baidu

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'baidu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baidu

## Usage


返回码 定义 英文返回描述
0 正常 ok
2 请求参数非法 Parameter Invalid
3 权限校验失败 Verify Failure
4 配额校验失败 Quota Failure
5 ak不存在或者非法 AK Failure
2xx 无权限
3xx 配额错误
puts map.get_xy_by_poiname('滨海公园','上海')
map = Baidumap.new('key')
require 'awesome_print'
lat = 40.3377039331399
lng = 116.647588831718
ap map.bus.around(lat,lng).info
puts map.get(39.911031821584,116.44931548023).for(1000).bus
puts map.geo('22.53','113.38')
Baidumap.get_baike('北京站')
Baidumap.get_cityid('北京') #=>131

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request