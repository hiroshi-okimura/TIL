# 毎年 5 月 1 日に、自分が運営している会社の社員一覧表を作成しています。表は年度ごとに更新され、社員の名前と年齢が載っています。
# ところで、会社のメンバーは昨年度から全く変わらず、社員の誕生日は全員 7 月 7 日だったので、
# 前年度の一覧表の年齢欄をそれぞれ +1 するだけで今年度の表が作れることにパイザ君は気づきました。

# 昨年度の一覧表が与えられるので、今年度の一覧表を出力してください。

n = gets.to_i
arr = []
n.times do
    arr = gets.split
    arr[1] = arr[1].to_i + 1
    puts arr.join(' ')
end

# 時刻を表す長さ 5 の文字列 S が “XX:XX” の形式で与えられます。与えられた時刻の 30 分後の時刻を同じ形式で出力してください。

# 1 行目に文字列 S が与えられます。
# S は “XX:XX” という形をしており、 ":" の左側は時を、右側は分を表します。時や分が一桁である場合、
# 十の位は 0 で埋められます。また、 00:00 から 23:59 までの 24 時間表記を採用しています。

s = gets

a = s.split(':').map(&:to_i)
h = a[0]
m = a[1]

m += 30
if m > 59
  m -= 60
  h += 1
end

h = h.to_s
m = m.to_s

h = '0' + h if h.length == 1
m = '0' + m if m.length == 1

puts h + ':' + m


# パイザ君の家の前では毎週日曜日に工事が行われます。この先 N 週間、工事が日曜日の何時に始まり、どれくらいの時間続くのかは分かっています。
# パイザ君は工事の間は家を離れようと思っているので、それぞれの日に工事が何時に終わるのかを知りたいと思いました。
# 工事が N 週間続くとして、各週日曜日の工事が始まる時刻と、工事が何時間何分続くのかに関する情報が与えられるので、
# 工事が終わる時刻を 00:00 から 23:59 までの 24 時間表記で出力してください（ここで「工事が終わる時刻」とは、
# 工事が h 時間 m 分続くとした場合、工事が始まった時刻の h 時間 m 分後を指します）。

n = gets.to_i

n.times do
  time, h, m = gets.split
  time_h, time_m = time.split(':').map(&:to_i)

  h = h.to_i
  m = m.to_i

  time_m += m
  if time_m >= 60
    time_m -= 60
    time_h += 1
  end

  time_h += h
  time_h %= 24

  time_h = time_h.to_s.rjust(2, '0')
  time_m = time_m.to_s.rjust(2, '0')

  puts "#{time_h}:#{time_m}"
end


# パイザ君の所属する会社では忘年会の余興で次のようなゲームを行います。まず、正整数 M が発表され、参加者は手元の紙に M 個、好きな数字を書きます。
# このとき、紙に書く数のそれぞれは 1 以上 M 以下であり、同じ数字を何度書いても構いません。
# その後、 1 以上 M 以下の数 K が発表され、各参加者は自分の紙に数字 K を書いた数だけポイントをもらい、ポイントの高い順に景品が配られます。

# 忘年会の参加者の人数 N と、数 M , K が与えられ、各参加者が書いた紙が与えられるので、それぞれの参加者の得点を計算して出力してください。

n, m, k = gets.split.map(&:to_i)
arr = []
n.times { arr.push(gets.split.map(&:to_i)) }

arr.each do |a|
    puts a.count(k)
end


# 正整数 n が与えられ、数のペアが n 個与えられます。各ペアの最初の数はりんごの個数を、その次の数はバナナの個数を表しています。
# これらの数のペアを以下の規則に従って、偉い順に並び替えてください。

# 1. ふたつのペアのりんごの数が異なる場合、りんごの数が多い方が偉い（この際、バナナの数は関係ない）。
# 2. りんごの数が同じである場合、バナナの数が多い方が偉い。

n = gets.to_i
arr = []
n.times { arr.push(gets.split.map(&:to_i)) }

arr.sort! do |a, b|
  if a[0] == b[0]
    b[1] <=> a[1]
  else
    b[0] <=> a[0]
  end
end

arr.each do |a|
  puts a.join(' ')
end


# N 人の人々がおり、それぞれの人は金と銀を何キログラムか持っています。
# 今は金の方が銀よりも価値が高いですが、ある日金と銀の価値が逆転して、人々の財産の多さは次のように決定されるようになりました。

# 1. 持っている銀が多い方が財産が多い。
# 2. 持っている銀が同じなら、持っている金が多い方が財産が多い。

# それぞれの人が持っている金と銀のキログラム数が与えられるので、この規則にしたがって、財産を多い順に並び替えて出力してください。

n = gets.to_i
arr = []
n.times { arr.push(gets.split.map(&:to_i)) }

arr.sort! do |a, b|
  if a[1] == b[1]
    b[0] <=> a[0]
  else
    b[1] <=> a[1]
  end
end

arr.each do |a|
  puts a.join(' ')
end


n 人の人に関して、それぞれの人の名前と財産が与えられます。
その後に人名 S が与えられるので （S は最初に与えられた名前のうちのいずれか） 、 S の財産を表す整数を出力してください。

n = gets.to_i
arr = []
n.times { arr.push(gets.chomp.split) }
s = gets.chomp

arr.each do |name, money|
    puts money if s == name
end

n = gets.to_i

properties = {}
n.times do
  s, a = gets.split(' ')
  properties[s] = a.to_i
end

s = gets.chomp
puts properties[s]


n 人の人の名前 s_1, ..., s_n が与えられたのち、 m 回の「攻撃」に関する情報が与えられます。各行は “p_i a_i” というフォーマットで与えられ、 
p_i はダメージを受けた人の名前 （s_1, ..., s_n のいずれか） 、 a_i は p_i が受けたダメージ数を表す数です。

最後に人名 S が与えられるので （S は s_1, ..., s_n のいずれか） 、 S が受けたダメージの合計を出力してください。
なお、一度もダメージを受けていない人の合計ダメージは 0 とします。

n = gets.to_i

damage = {}
n.times do
  name = gets.chomp
  damage[name] = 0
end

m = gets.to_i
m.times do
  name, attack = gets.split(' ')
  damage[name] += attack.to_i
end

s = gets.chomp
puts damage[s]


n 人の人の名前 s_1, ..., s_n が与えられたのち、 m 回の「攻撃」に関する情報が与えられます。
各行は “p_i a_i” というフォーマットで与えられ、 p_i はダメージを受けた人の名前 （s_1, ..., s_n のいずれか） 、 
a_i は p_i が受けたダメージ数を表す数です。なお、一度もダメージを受けていない人の合計ダメージは 0 とします。

それぞれの人が受けた合計ダメージを、人の名前のアルファベットの辞書順に出力してください。

n = gets.to_i

damage = {}
n.times do
  name = gets.chomp
  damage[name] = 0
end

m = gets.to_i
m.times do
  name, attack = gets.split(' ')
  damage[name] += attack.to_i
end


damage.sort.each do |name, damage|
    puts damage
end


p 人のグループ A , q 人のグループ B , r 人のグループ C があります。各グループのメンバーにはそれぞれ番号がつけられており、 
A グループの i 番目の人は B グループの j 番目の人に仕事を任せ、 B グループの j 番目の人は与えられた仕事を C グループの k 番目の人に任せます。
すると結局、 A グループの i 番目の人の仕事をするのは C グループの k 番目の人だということになります。

パイザ君は A グループの各人の仕事を結局 C グループの誰が行うことになるのか知りたがっています。 
A グループの人のそれぞれが最終的に C グループの誰に仕事を頼むことになるのかを、 A グループの人の番号が小さい順に p 行出力してください。

p, q, r = gets.split.map(&:to_i)
a = []
b = []
p.times { a.push(gets.split.map(&:to_i)) }
q.times { b.push(gets.split.map(&:to_i)) }

arr = []
ans = []
a.each do |a_per|
    b.each do |b_per|
        if a_per[1] == b_per[0]
            arr.push(a_per[0])
            arr.push(b_per[1])
            ans.push(arr)
        end
        arr = []
    end
end

ans.sort.each do |i|
    puts i.join(' ')
end

模範解答
n, m, l = gets.split(' ').map(&:to_i)

group_a = {}
n.times do
  num, req = gets.split(' ').map(&:to_i)
  group_a[num] = req
end

group_b = {}
m.times do
  num, req = gets.split(' ').map(&:to_i)
  group_b[num] = req
end

group_c = {}
n.times { |i| group_c[i + 1] = group_b[group_a[i + 1]] }

group_c.each do |val|
  puts val.join(' ')
end


10000 以上かつ 13 で割り切れるような最小の自然数を求めてください。

n = 10000
while n >= 10000
    if n % 13 == 0
        puts n
        break
    end
    n += 1
end


パイザ君と霧島京子は最初どちらも数 1 をもっています。パイザ君は自分の番が来ると、自分のもっている数の a 倍を霧島京子の数に足してあげます。
霧島京子は自分の番が来ると、自分のもっている数を b で割った余りをパイザ君の数に足してあげます。
この手続きをパイザ君の番から始めて、霧島京子の数がnより大きくなるまで繰り返します。

手続きが終わったときのパイザ君の操作回数を求めてください。

n = gets.to_i
a, b = gets.split(' ').map(&:to_i)

paiza, kyoko = 1, 1
times = 0
while true
  kyoko += paiza * a
  times += 1

  break if kyoko > n

  paiza += kyoko % b
end

puts times


カウンター魔法を得意とするパイザ君は、同じくカウンター魔法を使うモンスターと戦っています。
バトルはターン制で、パイザ君が先攻で、パイザ君とモンスターで交互に魔法を使い合います。
パイザ君の魔法は 1 回目と 2 回目に使うときにはダメージ 1 ですが、 
3 回目以降の n 回目には、(モンスターから受けた (n - 1) 回目の攻撃のダメージ) + (モンスターから受けた (n - 2) 回目の攻撃のダメージ) のダメージを与えます。
モンスターの魔法はこれよりも強力で、 1 回目と 2 回目には同じくダメージ 1 ですが、 
3 回目以降の n 回目には、 (パイザ君から受けた (n - 1) 回目の攻撃のダメージ) * 2 + (パイザ君から受けた (n - 2) 回目の攻撃のダメージ) のダメージを与えます。

パイザ君は自分がどれくらいモンスターの攻撃を耐えられるか知りたいと思っています。
パイザ君の体力を H として、両者が同じ魔法を使い続けたとき、モンスターの何回目の攻撃でパイザ君の体力が 0 以下になるかを出力してください。

h = gets.to_i

n = 1
paiza_attack = []
monster_attack = []
while h > 0
    if n == 1 || n == 2
        paiza_attack.push(1)
        monster_attack.push(1)
        h -= monster_attack[n-1]
        break if h <= 0
    else
        paiza_attack.push(monster_attack[n-2] + monster_attack[n-3])
        monster_attack.push(paiza_attack[n-2] * 2 + paiza_attack[n-3])
        h -= monster_attack[n-1]
        break if h <= 0
    end
    n += 1
end

puts n


C097

human, A, B = gets.chomp.split.map(&:to_i)
human.times do |i|
    if (i+1) % A == 0 && (i+1) % B == 0
        puts "AB"
    elsif (i+1) % A == 0
        puts "A"
    elsif (i+1) % B == 0
        puts "B"
    else
        puts "N"
    end
end