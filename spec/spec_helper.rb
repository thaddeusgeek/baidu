require 'baidu'
#请根据自己实际情况填写
BAIDU_MAP_KEY = '' #百度地图TOKEN
$searchWord = '' #根据Word查已投放关键词
$searchAdgroupName = '' #根据Adgroup查已投放的单元
$searchCampaignName = '' #根据Campaign查已投放的计划
$username = '' #账户
$password = '' #密码
$token = '' #token
$debug = false #需要调试时打开
$portfolio_ids = %w() #帐号id
$campaign_ids = %w() #计划id
$adgroup_ids = %w() #单元id
$keyword_ids = %w() #关键词id
$startDate = (Time.now - 24*3600).utc.iso8601
$endDate = Time.now.utc.iso8601
