# hubot-meshitero
https://github.com/Surigoma/hubot-meshi/  
これ使ったら飯テロ.inが~~サービス終了~~大規模リニューアル([Twitter](https://twitter.com/masawada/status/700269827139592192))して辛かったので  
GoogleCustomSearchAPIを利用して飯テロするhubot-scriptです。  

## Installation
scriptsにmeshi.coffeeを入れる  
↓  
HUBOT_MESHITERO_CHANNELを設定する  
(例:export HUBOT_MESHITERO_CHANNEL=#bottest)  
↓  
hubot再起動  
↓  
飯テロたのしい！！！  

## 使い方
どこのチャンネルでもいいので

飯テロ
飯テロ (キーワード)
飯テロ (回数)
飯テロ (キーワード) (回数)

のどれかでつぶやくとテロります。  
また自動的に夜10時に指定のチャンネルで飯テロします。  
回数はAPI1回につき10件までしか取得できないので10回までです。

## 技術的なこと
1API消費してランダムに表示します。  
また、同じものが被らないよう工夫しています。  
ちなみに、これをいじれば飯テロだけでなく進捗だめです([Twitter](https://twitter.com/surigomaxxxxxxx/status/701069692107030528))とかもできます。  
どこのチャンネルでもいいので  

飯テロ  
飯テロ (キーワード)  
飯テロ (回数)  
飯テロ (キーワード) (回数)  

のどれかでつぶやくとテロります。  
また自動的に夜10時に指定のチャンネルで飯テロします。  

## ライセンス
MIT
