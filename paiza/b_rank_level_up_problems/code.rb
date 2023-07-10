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