# n進数の変換アルゴリズム
N, M = gets.split.map(&:to_i)

base = ""
while N > 0
    base += (N % M).to_s
    N /= M
end

puts base.reverse

N, M = gets.chomp.split.map(&:to_i)

converted = ''

while N > 0
  digit = N % M
  converted = digit.to_s + converted
  N /= M
end

puts converted


# 整数 N, M, K が与えられます。
# N が M ずつ増えるとき、何回目に K を越えるか出力してください。

n, m, k = gets.split.map(&:to_i)

count = 0
while n <= k
    n += m
    count += 1
end

puts count


# 現在所持金を A 円持っています。
# 所持金が毎日 10% ずつ増えるとき、何日後に B 円を超えるか出力してください。
# また、増加するお金は小数点以下切り捨てで考えることとします。
# 例として、所持金が 831 円 のとき、10% は 83.1円 ですが、増加するお金は 83 円 です。

a, b = gets.split.map(&:to_i)

count = 0
while a <= b
    a += (a * 0.1).floor
    count += 1
end


# 整数 N が与えられます。
# N の階乗 N! を計算して出力してください。

n = gets.to_i

res = 1
for i in 1..n do
    res *= i
end

puts res


# 整数 N が与えられます。
# N の階乗 N! の末尾に 0 がいくつ付くか求め、出力してください。

n = gets.to_i

res = 1
for i in 1..n do
    res *= i
end

arr = res.to_s.split('').reverse

arr.each.with_index(1) do |a, i|
    if a == "0"
        res = i
    else
        break
    end
end

puts res

# 解答例

N = gets.to_i

count_zero = 0
while N > 0
    count_zero += N / 5
    N /= 5
end

puts count_zero

# 入力として一つの整数を受け取り、その整数が0になるまで5で割る処理を行います。
# それぞれの割り算の商の合計を出力します。これは一般的に、ある整数の階乗の結果に含まれる末尾の0の数を求める問題に使われます。


# N 個の整数 a_1, a_2, ..., a_N が与えられます。
# a_i に i を足したとき、a_1 , ... , a_N の最大値を出力してください。

n = gets.to_i
arr = gets.split.map(&:to_i)

res = []
arr.each.with_index(1) do |a, i|
    res.push(a + i)
end

puts res.max


# N 個の整数 a_1, a_2, ..., a_N が与えられます。
# a_i に i を足したとき、N 個の整数の最小値を出力してください。

n = gets.to_i
arr = gets.split.map(&:to_i)

res = []
arr.each.with_index(1) do |a, i|
    res.push(a + i)
end

puts res.min


# N 個の整数 a_1, a_2, ..., a_N が与えられます。
# a_1, a_2, ..., a_N のうち、1 がある位置を先頭から順に改行区切りで出力してください。
# a_1 を 1 番目とし、a_1, a_2, ..., a_N には少なくとも 1 個は 1 が含まれます。

n = gets.to_i
arr = gets.split.map(&:to_i)

arr.each.with_index(1) do |a, i|
    puts i if a == 1
end


# 整数 N が与えられます。
# N の約数の個数を出力してください。
# 約数とは、N を割り切る整数のことを指します。

n = gets.to_i

count = 0
for i in 1..n do
    count += 1 if n % i == 0
end

puts count

# 整数 N が与えられます。
# N の約数を小さい方から順に改行区切りで出力してください。

n = gets.to_i

count = 0
for i in 1..n do
    puts i if n % i == 0
end