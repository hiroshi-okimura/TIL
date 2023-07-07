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