require 'baidu'
#请根据自己实际情况填写
BAIDU_MAP_KEY = ''
$username = ''
$password =''
$token =''
$debug = false
$portfolio_ids = %w()
$campaign_ids = %w()
$adgroup_ids = %w()
$keyword_ids = %w()
$startDate = (Time.now - 24*3600).utc.iso8601
$endDate = Time.now.utc.iso8601