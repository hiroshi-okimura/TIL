2つの整数の組がn個与えられるので、各組の計算結果を足し合わせたものを出力してください。
各組の計算結果は次の値です。
・2つの整数の組を足し合わせたもの
・ただし、2つの整数が同じ値だった場合は、掛け合わせたもの

n = gets.to_i
arr = []
n.times { arr.push(gets.split.map(&:to_i)) }

ans = 0
arr.each do |a, b|
    if a == b
        ans += a * b
    else
        ans += a + b
    end
end

puts ans


スペース区切りの2つの整数と、文字列が入力されるので、2つの整数の範囲の部分文字列を出力してください。

a, b = gets.split.map(&:to_i)
n = gets.chomp
if a == b
    puts n[a-1]
else
    for i in a..b
        print n[i-1]
    end
end



スペース区切りの2つの整数と、文字列が入力されます。2つの整数の範囲の部分文字列を、大文字にして出力してください。

a, b = gets.split.map(&:to_i)
s = gets.chomp

for i in a-1..b-1
    s[i] = s[i].upcase
end
    
puts s


1行目で文字列 s、2行目で文字列 t が入力されます。
s が t の中で何回出現するかカウントして出力してください。

pattern = gets.chomp
string = gets.chomp

result = 0
(0..(string.size - pattern.size)).each do |i|
  substring = string.slice(i, pattern.size)

  result += 1 if substring == pattern
end

puts result



1行目に行数を表す整数 n、続く n 行の各行で「文字」と「整数」の組が空白区切りで入力されます。
n 個の組を、「整数」の値で昇順に並べ変え、「文字」を出力してください。

n = gets.to_i
arr = Array.new(n) { Array.new(2) }

n.times do |i|
    arr[i] = gets.chomp.split.reverse
    arr[i][0] = arr[i][0].to_i
end

arr.sort!
n.times { |i| puts arr[i][1] }



ハンドルネームの生成
str = gets.chomp
puts(str.delete("aiueoAIUEO"))


指定された配列（リスト）の定義の中で、同じ値が存在した場合はtrueを、そうでない場合はfalseを出力してください。
arr = "HND, NRT, KIX, NGO, NGO".chomp.split(', ')
puts (arr.count - arr.uniq.count) > 0


指定された配列（リスト）の定義の中で、同じ要素の数をカウントして、その数を出力してください。

array = %w[HND NRT KIX NGO NGO NGO NGO NGO]
count = {}

array.each do |element|
  if count[element]
    count[element] = count[element] + 1
  else
    count[element] = 1
  end
end

count.each { |_key, value| puts value if value != 1 }


1行目に行数を表す整数 n、続く n 行の各行で「文字」と「整数」の組が空白区切りで入力されます。
n 個の組について、「文字」の値が同じ組同士の数値を足しあわせてまとめ、まとめた数値の降順で、文字とまとめた数値の組を出力してください。
この際、まとめた数値は重複しません。

n = gets.to_i
hash = {}

n.times do
    s, n = gets.split
    if hash[s]
        hash[s] += n.to_i
    else
        hash[s] = n.to_i
    end
end

hash = hash.sort_by { |_, v| -v }.to_h
hash.each do |key, value|
    puts "#{key} #{value}"
end


5行5列の五目並べの盤面が与えられます。

盤面の各マスには、"O"か"X"か"."が書かれています。

"O"と"X"は、それぞれプレイヤーの記号を表します。

同じ記号が横に連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。

勝者の記号を1行で表示してください。
勝者がいない場合は、引き分けとして、"D"を表示してください。

arr = %w[O X]
result = 'D'

5.times do
    str = gets.chomp.split('')
    count = 0
    arr.each do |a|
        str.each do |s|
            count += 1 if a == s
            if count == 5
                result = a
                break
            end
        end
    end
end

puts result


5行5列の五目並べの盤面が与えられます。

盤面の各マスには、"O"か"X"か"."が書かれています。

"O"と"X"は、それぞれプレイヤーの記号を表します。

同じ記号が縦に連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。

勝者の記号を1行で表示してください。
勝者がいない場合は、引き分けとして、"D"を表示してください。

board = []
result = 'D'

# 盤面の初期化
(1..5).each { board.push(gets.chomp.split('')) }

(0..4).each do |i|
  o = 0
  x = 0
  board.each do |row|
    if row[i] == 'O'
      o = o + 1
    elsif row[i] == 'X'
      x = x + 1
    end
  end

  if o == 5
    result = 'O'
    break
  elsif x == 5
    result = 'X'
    break
  end
end

puts result



5行5列の五目並べの盤面が与えられます。

盤面の各マスには、"O"か"X"か"."が書かれています。

"O"と"X"は、それぞれプレイヤーの記号を表します。

同じ記号が斜めに連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。

勝者の記号を1行で表示してください。
勝者がいない場合は、引き分けとして、"D"を表示してください。


board = []
result = 'D'

# 盤面の初期化
(1..5).each { board.push(gets.chomp.split('')) }

(1..2).each do |time|
  o = 0
  x = 0

  i = 0

  if time == 1
    j = 0
  else
    j = 4
  end

  (1..5).each do
    if board[i][j] == 'O'
      o = o + 1
    elsif board[i][j] == 'X'
      x = x + 1
    else
      break
    end

    i = i + 1

    if time == 1
      j = j + 1
    else
      j = j - 1
    end
  end

  if o == 5
    result = 'O'
    break
  elsif x == 5
    result = 'X'
    break
  end
end

puts result



sinbol = %w[O X]
arr = []
ans = 'D'
count = 0

5.times { arr.push(gets.chomp.split('')) }

# 横
sinbol.each do |s|
    5.times do |i|
        5.times do |j|
            count += 1 if s == arr[i][j]
            if count == 5
                ans = s
            end
        end
        count = 0
    end
end


# 縦
sinbol.each do |s|
    5.times do |i|
        5.times do |j|
            count += 1 if s == arr[j][i]
            if count == 5
                ans = s
            end
        end
        count = 0
    end
end


# 斜1
sinbol.each do |s|
    5.times do |i|
        count += 1 if s == arr[i][i]
        if count == 5
            ans = s
        end
    end
    count = 0
end


# 斜2
sinbol.each do |s|
    5.times do |i|
        count += 1 if s == arr[i][4-i]
        if count == 5
            ans = s
        end
    end
    count = 0
end


puts ans


H, W = gets.chomp.split.map(&:to_i)
S = []
H.times { S.push(gets.chomp.split('')) }

y, x = gets.chomp.split.map(&:to_i)


move = [-1, 1]

S[y][x] = S[y][x] == '.' ? '#' : '.'

move.each do |i|
  if y + i >= 0 && y + i < H
    S[y + i][x] = S[y + i][x] == '.' ? '#' : '.'
  end
  if x + i >= 0 && x + i < W
    S[y][x + i] = S[y][x + i] == '.' ? '#' : '.'
  end
end

S.each do |row|
  puts row.join
end



paizaラーニングトップ > レベルアップ問題集 > Aランクレベルアップメニュー（言語選択） > 問題一覧 Ruby編 > マップからの座標取得 > マップからの座標取得 解答コード例・解説

h, w = gets.split.map(&:to_i)
board = h.times.map { gets.split('') }

board.each.with_index do |row, y|
    row.each.with_index do |obj, x|
        puts "#{y} #{x}" if obj == "#"
    end
end



B107

n, m, k = gets.split.map(&:to_i)

# 配列を取得
arr = (1..n).to_a

k.times do
    # Mに分け、2次元配列を作る。
    arr = arr.each_slice(m).to_a

    # シャッフル
    arr = arr.reverse

    # 1次元配列に戻す
    arr = arr.flatten
end

puts arr



B098

hatugen, ope_time, priod, good_ac = gets.split.map(&:to_i)

arr = []
ope_time.times { arr.push(gets.split.map(&:to_i)) }


index = 1
ans = false
# 対象期間の3つの配列を作成
sum_arr = Array.new(priod) { 0 }

for j in 0...hatugen
    for i in 0...ope_time
        # 一個ずつ入れればいい。ただし、末尾に代入
        sum_arr.shift
        sum_arr.push(arr[i][j])

        # 合計確認して、１０００以上だったらOK、違ったら次
        sum = sum_arr.sum
        if sum >= good_ac
            puts "yes #{index}"
            ans = true
            break
        end
        index += 1
    end
    puts "no 0" if !ans
    sum_arr = Array.new(priod) { 0 }
    index = 1
    ans = false
end



B095

human, long = gets.split.map(&:to_i)

longs = []
long.times { longs.push(gets.to_i) }

ans = []

human.times do
    # 1人目の値を配列で取得
    arr = []
    point = 100
    long.times { arr.push(gets.to_i) }

    for i in 0...long
        # 最初引き算して、差の絶対値を出す
        sa = (longs[i] - arr[i]).abs

        # 条件によって減点
        if sa <= 5 
            point -= 0
        elsif sa <= 10
            point -= 1
        elsif sa <= 20
            point -= 2
        elsif sa <= 30
            point -= 3
        else
            point -= 5
        end
    end
    
    point = 0 if point < 0
    ans.push(point)
    arr = []
    point = 100
end

puts ans.max



B104

human, setumon = gets.split.map(&:to_i)

# 入力を受け取る
answers = human.times.map { gets.split }

# 設問ごとに回答を取得
setumon.times do |i|
    valid_answers = []

    # 各回答者のi番目の設問の回答を取得
    human.times do |j|
        answer = answers[j][i]
        # 数字に変換できるかつ0以上100以下の整数であるかを確認
        if answer.to_i.to_s == answer && answer.to_i >= 0 && answer.to_i <= 100
            valid_answers << answer.to_i
        end
    end

    # 平均値を算出して出力
    if valid_answers.empty?
        puts 0
    else
        puts valid_answers.sum / valid_answers.size
    end
end



C023

tousen = gets.split.map(&:to_i)
n = gets.to_i


n.times do
    kosu = 0
    arr = gets.split.map(&:to_i)
    arr.each do |a|
        kosu += 1 if tousen.include?(a)
    end
    puts kosu
end
