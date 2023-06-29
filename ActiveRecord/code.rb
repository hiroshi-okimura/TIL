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