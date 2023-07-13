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