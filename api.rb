

#各種ライブラリを読み込む
require 'net/http'
require 'json'
require 'uri'

#uriライブラリ>URIモジュール
#該当するインスタンスを生成して返す
uri = URI.parse('https://www.jma.go.jp/bosai/forecast/data/overview_forecast/130000.json')
# => #<URI::HTTP http://hoge.com>

#net/httpライブラリ>Net::HTTPクラス
#URL先にGETリクエストを送り、そのボディを"文字列"として返す。
json = Net::HTTP.get(uri)

#josonライブラリ>JSONモジュール
#取得したJSON形式の文字列を、Rubyオブジェクトに変換して返す
json_responce = JSON.parse(json)

puts json_responce["publishingOffice"]