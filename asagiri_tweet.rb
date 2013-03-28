#! ruby -Ks
# -*- encoding: UTF-8 -*-
require "date"
require "twitter"
require "kconv"

# define values
CONSUMER_KEY = ""
CONSUMER_SECRET = ""
OAUTH_TOEKN = ""
OAUTH_TOEKN_SECRET = ""

# message head
h = ["速報","朗報","帰ってくるまでが大事", "チケット未購入者はお早めに", "迷ってるなら参加", "フジロックも好きです☆", "場内駐車場取れんかった！", "楽しみ楽しみ楽しみ楽しみ", "みんなで行こう！", "既に来年も楽しみ", "キター！","え？仕事って何?","ボランティアスタッフさんありがとうございます","準備しっかり","キャンプキャンプキャンプ"]
 
Twitter.configure do |config|
  config.consumer_key       = CONSUMER_KEY
  config.consumer_secret    = CONSUMER_SECRET
  config.oauth_token        = OAUTH_TOEKN
  config.oauth_token_secret = OAUTH_TOEKN_SECRET
end

# today
today = DateTime.now
today = today + Rational(9,24)
d1 = Date::new(today.year, today.month, today.day)

# asagiri
d2 = Date.new(2012,10,6)

# diff
diff = d2 - d1
diffint = (diff).to_i
diffstring = (diffint).to_s
#print(diff,"\n")
message =""
message = "【"
#message << d(100).to_s
message << h[rand(15)]
#message << h[14]
message << "】"

# create string
if diffint > 2 then
  message <<  "朝霧JAMまであと"
  message <<  diffstring
  message << "日♪\n"
elsif diffint == 1 then
 #print("朝霧JAM前日♪準備はバッチリですかー??\n");
 message << "朝霧JAM前日♪準備はバッチリですかー??\n"
elsif diffint == 0 then
  #print("朝霧JAM当日当日当日当日!忘れ物がないか再確認してね。ではまたお会いしましょー\n")
  message << "朝霧JAM当日当日当日当日!忘れ物がないか再確認してね。では現地でお会いしましょー♪\n"
elsif diffint == -1 then
  #print("朝霧JAM2日目deathよー♪悔いのないように思いっきり楽しみましょー\n");
  message << "朝霧JAM2日目♪悔いのないように思いっきり楽しみましょー!!\n"
elsif diffint == -2 then
  #print("朝霧JAM終了です♪来年またお会いましょー\n");
  message << "朝霧JAM終了です♪来年またお会いましょー!!!\n"
else 
end

if !(message == "") then
  Twitter.update(message.toutf8)
  puts DateTime.now 
  puts message.toutf8
end
