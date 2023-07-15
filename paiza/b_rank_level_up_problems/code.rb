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

arr = %w[O X]
result = 'D'

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