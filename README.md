# Rails + sb-admin2のテンプレート

gem 'twitter-bootstrap-rails'は使っていない。バグがあるし使いづらかった。

普通にrails g scaffoldでビューを作成して手でカスタマイズする。



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

- ユーザー一覧画面を作る（deviseを使わないで独自）
- ユーザー登録を作る。「登録完了後にこのユーザーとしてログインする」機能を作っておけば、自己登録もできるようになる
