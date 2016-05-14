# プロジェクト名

## development環境で起動

```bash
./bin/rails s -b 0.0.0.0
```

## production環境で起動


```bash
export RAILS_SERVE_STATIC_FILES=true
export SECRET_KEY_BASE=3821083108401980591204710974091283983408105801298301928312985012509710294712ab
RAILS_ENV=production ./bin/rake db:migrate
RAILS_ENV=production ./bin/rake assets:precompile
bundle exec unicorn_rails -c config/unicorn.rb -E production -D
```

## Railsメモ

### route

```
HTTP動詞     パス              コントローラ#アクション   目的
GET          /photos           photos#index              すべての写真の一覧を表示
GET          /photos/new       photos#new                写真を1つ作成するためのHTMLフォームを返す
POST         /photos           photos#create             写真を1つ作成する
GET          /photos/:id       photos#show               特定の写真を表示する
GET          /photos/:id/edit  photos#edit               写真編集用のHTMLフォームを1つ返す
PATCH/PUT    /photos/:id       photos#update             特定の写真を更新する
DELETE       /photos/:id       photos#destroy            特定の写真を削除する
```

```
resources :comments, only: [:index, :new, :create, :show, :edit, :update, :destroy]
```

ネストしたリソース

```
resources :posts do
  resources :comments, only: [:index, :new, :create]
end 
resources :comments, only: [:show, :edit, :update, :destroy]
```

### マイグレーション

```
rails g model Book isbn:string title:string price:integer publish:string published:date cd:boolean 
# この後マイグレーションファイルを編集してNOT NULLなどをつける。
# null: false, limit: 100
```

| マイグレーション | SQLite    |Ruby                    |
|------------------|-----------|------------------------|
| integer          | INTEGER   | Fixnum                 |
| decimal          | DECIMAL   | BigDecimal             |
| float            | FLOAT     | Float                  |
| string           | VARCHAR   | String                 |
| text             | TEXT      | String                 |
| binary           | BLOB      | String                 |
| date             | DATE      | Date                   |
| datetime         | DATETIME  | Time                   |
| timestamp        | DATETIME  | Time                   |
| time             | TIME      | Time                   |
| boolean          | BOOLEAN   | TrueClass/FalseClass   |


### 1対1

```
class Member < ActiveRecord::Base
  has_one :avatar
  accepts_nested_attributes_for :avatar
end

class Avatar < ActiveRecord::Base
  belongs_to :member
end
```

### 1対多

```
class Project < ActiveRecord::Base
  has_many :tasks
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end

class Task < ActiveRecord::Base
  belongs_to :project
end
```

1画面内で親子を両方編集できるようにするには、cocoonというgemを使うと良い。
https://github.com/nathanvda/cocoon

[複数の子レコードを作成・更新する. accepts_nested_attributes_for - Qiita](http://qiita.com/hmuronaka/items/818c421dc632e3efb7a6)



### 多対多

```
class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags
end

class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, through: :post_tags
end

class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
end
```

### バリデーションのサンプル

```
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
```


### Scaffold

```
rake rails:templates:copy
```

でScaffoldのテンプレートをコピーしてカスタマイズできる。


### 設定ファイルの読み込み順序

- application.rb
- environments/development.rb
- initializersの中（アルファベット順）
- routes.rb
