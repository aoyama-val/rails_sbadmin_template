# Rails + sb-admin2のテンプレート

Deviseを使わない独自ログイン機能つき。

gem 'twitter-bootstrap-rails'は使っていない。バグがあるし使いづらかった。

普通にrails g scaffoldでビューを作成して手でカスタマイズする。


## セットアップ

```
bundle install
bin/rake db:migrate
bin/rake db:fixtures:load
```


## 起動（開発環境）

```
bin/rails s -b 0.0.0.0
```

## ログインできるユーザーを追加するには

`bin/rails c`から

```
User.create!(:email => "aosho235@gmail.com", :name => "青山正太郎", :password => "hoge", :password_confirmation => "hoge")
```


## TODO

- ページング機能
