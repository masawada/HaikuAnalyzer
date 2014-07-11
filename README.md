ハイク・アナライザ
==================

ハイクを詠め。カイシャクしてやる。

## これはなに？

入力された文字列が5/7/5の音を持っているか識別してtrue/falseを返します。ジユウリツ=ハイク？知らねぇな

## 必要なもの
* Ruby
* MeCab
* Readline
* Bundler

`MeCab`は[ここらへん](http://qiita.com/ysk_1031/items/7f0cfb7e9e4c4b9129c9)を参考にmecabとmecab-ipadicをインストールしてください。Linuxの人は自分で調べられると思います


MeCabのインストールが終わったら`bundle install --path vendor/bundle`しましょう。

## 使い方
```
$ bundle exec ruby app.rb
> 古池や蛙飛び込む水の音
これはハイクです
> 五月雨や大河を前に家二軒
これはハイクです
> 金をくれ
これはハイクではありません
> フィニッシュ
ハイク・アナライザを終了します
```

awesome!!!!!!!!!!!!!!!!!!!!!

## 中でやってること
* MeCabで形態素解析します
* 読みを取得します
* 音数に変換します
  * 具体的には
    * 長音(ー): 一音として数えますが、5/7/5の最後についた場合は数えません
    * 拗音(ぁぃぅぇぉゃゅょ): 数えません
    * 促音(っ): 一音として数える
    * 撥音(ん): 一音として数えますが、5/7/5の最後についた場合は数えません
    * 母音(あいうえお): 一音として数えますが、5/7/5の最後についた場合は数えません
* 音数を足しあわせて5/7/5になっているか確認します

## らいせんす
The MIT License (MIT)

Copyright (c) 2014 Masayoshi Wada <developer@andantesoftware.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
