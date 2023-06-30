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