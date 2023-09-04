あなたは今、とある戦略ゲームをプレイしています。
ゲームの中で、敵を攻撃するために、フィールドに爆弾を仕掛けました。
敵がフィールド内に入ったところで一気に爆弾を点火し、敵に攻撃をする寸法です。

フィールドは縦 H 行、横 W 行のマス目としてあらわされ、これらのマス目のうちのいくつかに爆弾が仕掛けてあります。
i 行目、j 列目の爆弾が爆発すると、i 行目全体と j 列目全体に爆風が広がります。

あなたはすでにフィールド上に爆弾を仕掛け終わりました。
フィールド上の爆弾を一気に点火した場合、いくつのマスに爆風が広がるかを計算してください。

h, w = gets.split.map(&:to_i)
arr = []
h.times { arr.push(gets.chomp.split('')) }


bakudan = []
for i in 0..h-1
    for j in 0..w-1
        if arr[i][j] == "#"
            bakudan.push("#{i} #{j}")
        end
    end
end

bakudan_num = bakudan.length

arr2 = []
bakudan.each do |obj|
    arr2.push(obj.split.map(&:to_i))
end


for i in 0...bakudan_num
  # 行に爆風を広げる
  w.times { |num| arr[arr2[i][0]][num] = "#" }

  # 列に爆風を広げる
  h.times { |num| arr[num][arr2[i][1]] = "#" }
end

count = arr.flatten.count("#")

puts count



あなたは、縦が N 区画、横が M 区画からなる畑に空中から種を植えるドローンを開発しました。
このドローンは、T を奇数の整数として高さ T メートルから種をまくと、ドローンのいる区画を中心として一辺が T マスの正方形の辺の位置に種が植わる仕様になっています。
なお、本来種が植わる場所に畑が存在しない場合は、畑が存在する場所のみに種がまかれます。
S 回種をまきました。
S 回それぞれについて、ドローンがどの位置の、高さ何メートルから種をまいたかについての情報が与えられるので、畑のどの位置にいくつの種が植えられているか求めるプログラムを作成してください。

入力される値
入力は以下のフォーマットで与えられます。

N M
S
T_1 X_1 Y_1
T_2 X_2 Y_2
...
T_S X_S Y_S
・1 行目には、畑の縦の区画の数を表す整数 N、横の区画の数を表す整数 M がこの順で半角スペース区切りで与えられます。
・2 行目には、何回種をまいたかを表す整数 S が与えられます。
・続く S 行のうちの i 行目 (1 ≦ i ≦ S) には、i 回目の種まきでドローンが種をまいた高さを表す整数 T_i、種をまいた場所が畑の左から何区画目かを表す整数 X_i、種をまいた場所が畑の上から何区画目かを表す整数 Y_i がこの順で半角スペース区切りで与えられます。
・入力は合計で 2 + S 行となり、入力値最終行の末尾に改行が 1 つ入ります。

期待する出力
畑のそれぞれの区画にいくつの種が植わっているかを以下の形式でを出力してください。
F_{1, 1} F_{1, 2} ... F_{1, M}
F_{2, 1} F_{2, 2} ... F_{2, M}
...
F_{N, 1} F_{N, 2} ... F_{N, M}
・j 行目 (1 ≦ j ≦ N) には、畑の上から j 行目の M 個の区画全てについて、それぞれの区画に植わっている種の個数を表す整数を左からスペース区切りで出力してください。
・より形式的に、 j 行目 (1 ≦ j ≦ N) の左から k 番目 (1 ≦ k ≦ M) に出力する値は、畑の上から j 行目の左から k 列目の区画に植わっている種の個数を表す整数 F_{j, k} です。
・出力最終行の末尾に改行を入れ、余計な文字、空行を含んではいけません。

入力例1
4 6
3
3 3 2
1 6 1
5 6 4

出力例1
0 1 1 1 0 1
0 1 0 2 1 1
0 1 1 2 0 0
0 0 0 1 0 0

n, m = gets.split.map(&:to_i)

# fieldの用意
field = Array.new(n) { Array.new(m, 0) }

how_many = gets.to_i

how_many.times do
    high, x, y = gets.split.map(&:to_i)
    key = (high - 1) / 2
    for i in [0, x-key-1].max..[m-1, x+key-1].min
        for j in [0, y-key-1].max..[n-1, y+key-1].min
            if (x-1-i).abs == key || (y-1-j).abs == key
                field[j][i] += 1
            end
        end
    end
end

field.each do |ans|
    puts ans.join(' ')
end



B131

n, m = gets.split.map(&:to_i)
rosen = Array.new(n) { gets.split.map(&:to_i) }


x = gets.to_i
keiyu = Array.new(x) { gets.split.map(&:to_i) }


untin = 0
now_sta = 1

keiyu.each do |k|
    untin += (rosen[k[0]-1][k[1]-1] - rosen[k[0]-1][now_sta-1]).abs
    now_sta = k[1]
end

puts untin



B108

# ゴンドラの数とグループの数を取得
n, m = gets.split.map(&:to_i)

# 各ゴンドラの乗車可能人数を取得
a = []
n.times do
  a << gets.to_i
end

# 各グループの人数を取得
b = []
m.times do
  b << gets.to_i
end

# 各ゴンドラに乗った人数を保存する配列
c = Array.new(n, 0)

# 現在のゴンドラのインデックス
current_gondola = 0

# 各グループの人々をゴンドラに乗せる
b.each do |group|
  while group > 0
    # ゴンドラに乗れる人数を計算
    ride = [a[current_gondola], group].min

    # ゴンドラに乗った人数を更新
    c[current_gondola] += ride

    # グループの残りの人数を更新
    group -= ride

    # 次のゴンドラに移動
    current_gondola = (current_gondola + 1) % n
  end
end

# 結果を出力
c.each do |num|
  puts num
end
                    