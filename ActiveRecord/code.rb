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