require 'baidu'
#请根据自己实际情况填写
BAIDU_MAP_KEY = '46E9167407189d7658f392fb222b7b36'
$username = 'PC_酒店_精确' #pid=184
$password ='elong@3602013'
$token ='3031975200fd9ab94c630a45cae0300f50d7adb8b7ac05a27'
$debug = true
$portfolio_ids = %w(303197520)
$campaign_ids = %w(818131555 818131043 818131299) #cid = 7985 7986 7987
$adgroup_ids = %w(197366064 197369392 197369648) #aid = 3599772 3599773 3599774
$keyword_ids = %w(1288192315 1288192059 365495978) #kid = 61583946 61583945 61583944
$startDate = (Time.now - 24*3600).utc.iso8601
$endDate = Time.now.utc.iso8601
ac = Baidu::SEM::AccountService.new
ac.username = $username
ac.password = $password
ac.token = $token
ac.debug = true
puts ac.getAccountInfo
exit
as = Baidu::SEM::AdgroupService.new
as.username = $username
as.password = $password
as.token = $token
puts as.example('getAdgroupByAdgroupId')
exit