# 初級： User モデルがあるとき、全てのユーザーをデータベースから取得するためのActiveRecordのコードは何ですか？
User.all

# 初級： User モデルが name と email のカラムを持つ場合、 name が "Alice" のユーザーを検索するためのコードは何ですか？
User.find_by(name: "Alice")

# 初級： User モデルに新しいユーザーを作成し、その名前を "Bob"、メールを "bob@example.com" にするためのコードは何ですか？
User.create(name: 'Bob', email: 'bob@example.com')

# 中級： User モデルが Post モデルと 1対多 のリレーションを持つ場合、 User のインスタンス user が持つ全ての Post を取得するためのコードは何ですか？
user = User.find(1)
user.posts

# 中級： Post モデルが comments_count というカウンターキャッシュのカラムを持つ場合、このカウンターキャッシュを手動で更新するためのコードは何ですか？
user = User.find(1)
user.update(comments_count: user.comments.count)

# 初級

# Book モデルがあり、title と author のカラムを持っています。
# title が "The Great Gatsby" で author が "F. Scott Fitzgerald" の新しい Book レコードを作成するためのActiveRecordのコードを書いてください。
Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald")

# 上記の Book モデルを使用して、 author が "F. Scott Fitzgerald" の全ての本を取得するためのActiveRecordのコードを書いてください。
Book.where(author: "F. Scott Fitzgerald")

# 中級

# User モデルが Post モデルと 1対多 のリレーションを持つ場合、あるユーザーの全ての投稿を削除するためのActiveRecordのコードを書いてください。
user = User.find(1)
user.posts.destroy_all

# User モデルには email カラムがあります。メールアドレスに ".com" が含まれている全てのユーザーを取得するためのActiveRecordのコードを書いてください。
User.where("email LIKE '%.com'")

# 上級

# User モデルと Post モデルがあり、 Post モデルには views というカラムがあります。
# 全てのユーザーをそのユーザーが書いた投稿のビュー数の合計が多い順にソートするためのActiveRecordのコードを書いてください。
User.joins(:posts).group(:id).order("SUM(views) DESC")


# 初級

# User モデルに age というカラムがあります。20歳以上の全てのユーザーを取得するためのActiveRecordのコードを書いてください。
User.where("age >= 20")
SELECT * FROM users WHERE age >= 20;

# User モデルがあり、name と email のカラムを持っています。
# ユーザーの名前が "John Doe" でメールアドレスが "john.doe@example.com" のユーザーを更新するためのActiveRecordのコードを書いてください。
user = User.find_by(name: "John Doe", email: "john.doe@example.com")
user.update(name: "John Doe", email: "john.doe@example.com")
UPDATE users SET name = "John Doe", email = "john.doe@example.com"

# 中級

# User モデルと Post モデルがあり、 User モデルは Post モデルと 1対多 のリレーションを持つ場合、
# ユーザーが1つ以上の投稿を持っているユーザーのみを取得するためのActiveRecordのコードを書いてください。
User.joins(:posts).group(:id).having("COUNT(posts.id) >= 1")
SELECT * FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id HAVING COUNT(posts.id) >= 1;
# or
User.joins(:posts).distinct
SELECT DISTINCT users.* FROM users INNER JOIN posts ON posts.user_id = users.id;

# User モデルには email カラムがあります。メールアドレスが空のユーザーがいるかどうかを確認するためのActiveRecordのコードを書いてください。
User.where(email: nil).exists?
SELECT * FROM users WHERE email IS NULL;

# 上級

# User モデルと Post モデルがあり、 Post モデルには created_at というカラムがあります。各ユーザーの最新の投稿を取得するためのActiveRecordのコードを書いてください。
User.joins(:posts).group(:id).select("users.*, MAX(posts.created_at) AS latest_post")
SELECT users.*, MAX(posts.created_at) AS latest_post FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id;


初級: 
Post.allを用いてデータベースから全ての投稿を取得するコードを書いてください。
Post.all
SELECT * FROM posts;

初級: 
Post.where(title: 'My first post') を用いて、タイトルが 'My first post' である全ての投稿を取得するコードを書いてください。
Post.where(title: 'My first post')
SELECT * FROM posts WHERE title = 'My first post';

中級: 
UserとPostモデルがあり、Userは多数のPostを持つ(has_many :posts)関係にあるとします。
あるユーザー（例えば、idが3のユーザー）の全ての投稿を取得するコードを書いてください。
User.find(3).posts
SELECT * FROM posts WHERE user_id = 3;

中級: 
UserとPostモデルがあり、Userは多数のPostを持つ(has_many :posts)関係にあるとします。
ユーザーが作成した投稿の数が10以上の全てのユーザーを取得するコードを書いてください。
User.joins(:posts).group(:id).having("COUNT(posts.id) >= 10")
SELECT * FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id HAVING COUNT(posts.id) >= 10;

上級: 
UserとPostモデルがあり、Userは多数のPostを持つ(has_many :posts)関係にあるとします。
また、Postはviewsというinteger型のフィールドを持っており、これはその投稿が何回見られたかを示します。
全てのユーザーをそのユーザーの全ての投稿の合計ビュー数に基づいて降順でソートするコードを書いてください。
User.joins(:posts).group(:id).order("SUM(posts.views) DESC")
SELECT * FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id ORDER BY SUM(posts.views) DESC;


初級: データベースから最初の投稿を取得するコードを書いてください。
Post.first
SELECT * FROM posts ORDER BY id ASC LIMIT 1;

初級: 全ての投稿を新しい順に並べ替えるコードを書いてください。https://pikawaka.com/rails/order
Post.order("created_at DESC")
SELECT * FROM posts ORDER BY created_at DESC;

中級: UserとPostモデルがあり、Userは多数のPostを持つ(has_many :posts)関係にあるとします。
あるユーザー（例えば、idが5のユーザー）の投稿を最新のものから順に取得するコードを書いてください。
User.find(5).posts.order(created_at: :desc)
SELECT * FROM posts WHERE user_id = 5 ORDER BY created_at DESC;

中級: UserとPostモデルがあり、Userは多数のPostを持つ(has_many :posts)関係にあるとします。
各ユーザーが作成した投稿の数をユーザーごとに取得するコードを書いてください。
User.joins(:posts).group(:id).select("users.*, COUNT(posts.id) AS posts_count")
SELECT users.*, COUNT(posts.id) AS posts_count FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id;

上級: UserとPostモデルがあり、Userは多数のPostを持つ(has_many :posts)関係にあるとします。
また、Postはlikesというinteger型のフィールドを持っており、これはその投稿が何回いいねされたかを示します。
各ユーザーの投稿が合計で何回いいねされたかをユーザーごとに取得するコードを書いてください。
User.joins(:posts).group(:id).select("users.*, SUM(posts.likes) AS likes_count")
SELECT users.*, SUM(posts.likes) AS likes_count FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id;


初級: 
Post モデルに published という boolean 型のフィールドがあるとします。公開されたすべての投稿を取得するコードを書いてください。
Post.where(published: true)
SELECT * FROM posts WHERE published = true;

初級: 
Post モデルに likes という integer 型のフィールドがあるとします。いいねの数が10以上の投稿をすべて取得するコードを書いてください。
Post.where("likes >= 10")
SELECT * FROM posts WHERE likes >= 10;

中級: 
User モデルと Post モデルがあり、User は多数の Post を持つ(has_many :posts)関係にあるとします。
あるユーザー（例えば、idが3のユーザー）の投稿をすべて取得し、N+1問題を避けるコードを書いてください。
user = User.includes(:posts).find(3)
user.posts
SELECT * FROM users WHERE id = 3 LIMIT 1;
SELECT * FROM posts WHERE user_id = 3;


中級: 
User モデルと Post モデルがあり、User は多数の Post を持つ(has_many :posts)関係にあるとします。
各ユーザーが公開した投稿の数をユーザーごとに取得するコードを書いてください。
User.joins(:posts).group(:id).select("users.*, COUNT(posts.id) AS posts_count")
SELECT users.*, COUNT(posts.id) AS posts_count FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id;

上級: 
User モデルと Post モデルがあり、User は多数の Post を持つ(has_many :posts)関係にあるとします。
また、Post は likes という integer 型のフィールドを持っており、これはその投稿が何回いいねされたかを示します。
各ユーザーの投稿がそれぞれ何回いいねされたかの平均値をユーザーごとに取得するコードを書いてください。
User.joins(:posts).group(:id).select("users.*, AVG(posts.likes) AS likes_average")
SELECT users.*, AVG(posts.likes) AS likes_average FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id;


初級 
Userモデルがあり、その中にnameという属性があるとします。nameが"John"のユーザーを全て取得するためのActiveRecordクエリを書いてください。
User.where(name: "John")
SELECT * FROM users WHERE name = "John";

中級 
Userモデルがあり、その中にcreated_atという属性があるとします。今日作成されたユーザーを全て取得するためのActiveRecordクエリを書いてください。
User.where(created_at: Time.zone.now.all_day)
SELECT * FROM users WHERE created_at BETWEEN '2020-01-01 00:00:00' AND '2020-01-01 23:59:59';

中級 
UserモデルとPostモデルがあり、Userは多数のPostを持つ(has_many :posts)関連付けがされているとします。
特定のユーザー(user)が持つポストを全て取得するためのActiveRecordクエリを書いてください。
User.find(1).posts
SELECT * FROM posts WHERE user_id = 1;

上級 
UserモデルとPostモデルがあり、Userは多数のPostを持つ(has_many :posts)関連付けがされているとします。
また、Postモデルにはlikesという整数型のカラムがあります。全てのユーザーを、そのユーザーが持つポストのlikesの合計が多い順にソートした結果を取得するためのActiveRecordクエリを書いてください。
User.joins(:posts).group(:id).order("SUM(posts.likes) DESC")
SELECT * FROM users INNER JOIN posts ON posts.user_id = users.id GROUP BY users.id ORDER BY SUM(posts.likes) DESC;
