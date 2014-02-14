# Baidu

Baidu SEM Services
Baidu Ranking Services
Baidu Map Services

## Installation

Add this line to your application's Gemfile:

    gem 'baidu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install baidu

## Acknowledged
camel命名法，用于request数据格式
snake命名法，用于response数据格式

## Rspec
先修改spec/spec_helper.rb

```ruby

BAIDU_MAP_KEY = ''
$username = ''
$password = ''
$token = ''

```

## Usage

SEM

```ruby
require 'baidu'

$auth = Baidu::Auth.new
$auth.username = 'username'
$auth.password = 'password'
$auth.token = 'token'

ss = Baidu::SEM::SearchService.new
res = ss.getKeywordBySearch({:searchWord=>'word',:searchType=>0})
res = ss.getKeywordBySearch({:searchWord=>'word',:searchType=>0},true) #debug=true
```

MAP

```ruby
#返回码 定义 英文返回描述
#0 正常 ok
#2 请求参数非法 Parameter Invalid
#3 权限校验失败 Verify Failure
#4 配额校验失败 Quota Failure
#5 ak不存在或者非法 AK Failure
#2xx 无权限
#3xx 配额错误
puts map.get_xy_by_poiname('滨海公园','上海')
map = Baidu::Map.new('key')
require 'awesome_print'
lat = 40.3377039331399
lng = 116.647588831718
ap map.bus.around(lat,lng).info
puts map.get(39.911031821584,116.44931548023).for(1000).bus
puts map.geo('22.53','113.38')
Baidumap.get_baike('北京站')
Baidumap.get_cityid('北京') #=>131
```

##Documents


###RankingService


####方法


#####getPreview


Request: GetPreviewRequest

属性名             | 类型        |   意义    |   限制        | 说明
----------------|---------------|-------------|---------------|-----------------
keyWords         | List String     | 关键词字面 | 必填             |目前最多输入5个关键词，超过报错。
device             | int                  | 设备类型     | 必填 | 0:PC 目前只支持PC的推广实况，移动推广实况会于近期推出|
region  | int | 地域代码  |必填 | 目前支持二级地域，地域对照表详见《地域对照表》
page | int | 页码 | 选填|推广实况的页码，从0开始为第一页
display | int | 数据展现方式  | 必填 |0:html 该字段为预留字段，目前只支持HTML格式的数据返回方式

Response:GetPreviewResponse

属性名  | 类型 | 说明
---------|--------|----------
previewInfos  | List<PreviewInfo>  | 关键词的推广实况数据（html格式）

ResponseFormat:PreviewInfo

属性名 |  类型 | 说明 | 限制
---------|-------|-----|------
keyword | String | 关键词字面  |  -
data | String | 使用gzip进行压缩的推广实况的HTML数据， 解压缩之前请将用base64解码，然后gzip解压，解压后再使用utf-8编码转换为String，即为推广实况的实际HTML数据 | -

####
####区域代码

地域代码  地域名称

```
1 北京
2 上海
3 天津
4 广东
5 福建
7 日本
8 海南
9 安徽
10  贵州
11  甘肃
12  广西
13  河北
14  河南
15  黑龙江
16  湖北
17  湖南
18  吉林
19  江苏
20  江西
21  辽宁
22  内蒙古
23  宁夏
24  青海
25  山东
26  山西
27  陕西
28  四川
29  西藏
30  新疆
31  云南
32  浙江
33  重庆
34  香港
35  台湾
36  澳门
37  其他国家
82  江门
83  揭阳
84  广州
85  潮州
86  茂名
88  梅州
89  清远
90  佛山
91  汕头
92  汕尾
93  深圳
94  韶关
109 阳江
110 湛江
111 云浮
112 中山
113 珠海
114 肇庆
115 河源
116 东莞
117 惠州
48  莆田
49  南平
50  龙岩
51  宁德
52  泉州
66  三明
70  厦门
80  漳州
81  福州
296 东方
297 琼海
298 三亚
299 文昌
300 五指山
301 万宁
302 海口
303 儋州
127 淮北
128 安庆
129 巢湖
130 池州
131 滁州
132 黄山
133 淮南
134 马鞍山
135 六安
136 宣城
137 宿州
138 铜陵
139 芜湖
140 阜阳
141 蚌埠
142 合肥
143 亳州
118 贵阳
119 安顺
120 六盘水
121 黔南
122 黔东南
123 黔西南
124 毕节
125 铜仁
126 遵义
255 酒泉
256 金昌
257 嘉峪关
258 兰州
259 陇南
260 平凉
261 临夏
262 庆阳
263 定西
264 武威
265 天水
266 张掖
267 白银
477 甘南
95  桂林
96  贵港
98  防城港
99  南宁
100 来宾
101 柳州
102 钦州
103 梧州
104 北海
105 玉林
106 河池
107 贺州
108 百色
478 崇左
304 保定
305 沧州
306 承德
307 廊坊
325 秦皇岛
326 邢台
327 石家庄
329 唐山
330 邯郸
331 张家口
332 衡水
308 焦作
309 安阳
310 开封
311 洛阳
312 漯河
313 平顶山
314 驻马店
315 南阳
316 濮阳
317 新乡
318 信阳
319 许昌
320 商丘
321 三门峡
322 郑州
323 鹤壁
324 周口
476 济源
333 鸡西
334 佳木斯
335 哈尔滨
336 牡丹江
337 齐齐哈尔
338 七台河
339 绥化
340 双鸭山
341 伊春
342 大庆
343 大兴安岭
344 鹤岗
345 黑河
346 荆门
347 荆州
348 黄石
349 黄冈
364 潜江
365 孝感
366 恩施
367 随州
368 神农架
369 十堰
370 襄樊
371 武汉
372 仙桃
373 天门
375 咸宁
376 宜昌
377 鄂州
350 怀化
351 常德
352 长沙
353 郴州
354 娄底
355 邵阳
356 湘潭
357 湘西
358 张家界
359 益阳
360 衡阳
361 岳阳
362 永州
363 株洲
38  吉林
39  白城
40  长春
41  辽源
42  白山
43  四平
44  松原
45  通化
47  延边
53  淮安
54  常州
55  南京
56  南通
57  连云港
58  徐州
59  苏州
60  宿迁
61  泰州
62  无锡
63  盐城
64  扬州
65  镇江
67  九江
68  吉安
69  景德镇
71  萍乡
72  南昌
73  新余
74  上饶
75  宜春
76  鹰潭
77  赣州
78  抚州
144 丹东
145 本溪
146 锦州
147 朝阳
148 辽阳
149 盘锦
150 阜新
151 鞍山
152 抚顺
153 沈阳
154 铁岭
155 大连
156 营口
157 葫芦岛
158 赤峰
159 阿拉善盟
160 兴安盟
161 通辽
162 巴彦淖尔
163 乌兰察布
164 乌海
165 锡林郭勒盟
166 呼伦贝尔
167 呼和浩特
168 鄂尔多斯
169 包头
170 固原
171 石嘴山
172 吴忠
173 中卫
174 银川
175 西宁
176 海东
177 海西
178 玉树
479 海南
196 济南
197 济宁
198 莱芜
199 聊城
200 德州
201 临沂
202 青岛
203 日照
204 潍坊
207 淄博
208 泰安
218 威海
219 烟台
220 东营
221 枣庄
222 菏泽
223 滨州
205 晋城
206 晋中
209 长治
210 吕梁
211 临汾
212 忻州
213 朔州
214 太原
215 阳泉
216 运城
217 大同
239 宝鸡
240 安康
241 商洛
242 铜川
243 渭南
244 西安
245 咸阳
246 延安
248 汉中
249 榆林
224 广安
225 广元
226 成都
227 眉山
228 凉山
229 绵阳
230 攀枝花
231 南充
232 德阳
233 乐山
234 泸州
235 内江
236 甘孜
237 遂宁
238 资阳
247 巴中
250 达州
251 雅安
252 阿坝
253 自贡
254 宜宾
268 那曲
269 拉萨
270 林芝
271 日喀则
480 昌都
179 哈密
180 博尔塔拉
181 昌吉
182 阿勒泰
183 喀什
184 克拉玛依
185 阿克苏
186 克孜勒苏柯尔克孜
187 石河子
188 塔城
189 五家渠
190 吐鲁番
191 巴音郭楞
192 乌鲁木齐
193 伊犁
195 和田
283 楚雄
284 昆明
285 丽江
286 德宏
287 临沧
288 曲靖
289 保山
290 普洱
291 文山
292 大理
293 红河
294 昭通
295 玉溪
481 怒江
482 迪庆
483 西双版纳
272 金华
273 嘉兴
274 衢州
275 丽水
276 宁波
277 绍兴
278 温州
279 台州
280 杭州
281 舟山
282 湖州
```

####错误代码

```
90191801=The request keyword number is zero
90191802=The request keyword number is more than maximum
90191803=The request device code is neither 0(PC) nor 1(MOBILE)
90191804=The request display code is neither 0(HTML) nor 1(Structure)
90191805=The request page number is invalid
90191806=The request region code is invalid
90191807=The Server is too busy to response, please try again later
90191808=Server internal error, please check your request and try again later.
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request