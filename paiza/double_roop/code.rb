# 正の整数 N が与えられるので、1 〜 N の整数を 1 から順に半角スペース区切りで 1 行で出力してください。

n = gets.to_i
arr = []
for i in 1..n do
    arr.push(i)
end
puts arr.join(' ')


# 正の整数 N が与えられるので、1 〜 N の整数を 1 から順に改行区切りで N 行で出力してください。

n = gets.to_i
for i in 1..n do
    puts i
end


# 整数 N が与えられるので、 1 から 5 までの数字を半角スペース区切りしたもの
# "1 2 3 4 5" を N 行出力してください。

arr = '1 2 3 4 5'
n = gets.to_i

n.times { puts arr }


# 整数 N , K が与えられるので、 1 から N までの数字を半角スペース区切りしたもの
# "1 2 ... (N-1) N" を K 行出力してください。

n, k = gets.split.map(&:to_i)
arr = []
for i in 1..n do
    arr.push(i)
end

k.times { puts arr.join(' ') }


# 整数 N , K と N 行 K 列 の二次元配列 A が与えられるので、その配列をそのまま出力してください。

n, k = gets.split.map(&:to_i)
arr = []

n.times { arr.push(gets.chomp.split.map(&:to_i)) }

n.times { |i| puts arr[i].join(' ') }


# 整数 N , K と N 行 K 列 の二次元配列 A が与えられます。 A の要素のうち、1 要素だけ 1 になっている要素があるので、その要素の行と列を出力してください。

n, k = gets.split.map(&:to_i)
arr = []

n.times { arr.push(gets.chomp.split.map(&:to_i)) }

n.times do |i|
    k.times do |j|
        if arr[i][j] == 1
            puts "#{i + 1} #{j + 1}"
        end
    end
end


# 整数 N , K と N 行 K 列 の二次元配列 A が与えられます。 A の要素のうち、最大の要素の値を出力してください。

n, k = gets.split.map(&:to_i)
arr = []

n.times { arr.push(gets.chomp.split.map(&:to_i)) }

puts arr.flatten.max


# 模範解答

puts 'Enter two integers: '
n, k = gets.split.map(&:to_i)

a = []
n.times do
  puts 'Enter list of integers: '
  a << gets.split.map(&:to_i)
end

ans = 0
for i in 0...n
  for j in 0...k
    if a[i][j] > ans
      ans = a[i][j]
    end
  end
end

puts ans


# 整数 N , K と N 行 K 列 の二次元配列 A が与えられるので、 A の行ごとの和を出力してください。

n, k = gets.split.map(&:to_i)
arr = []

n.times { arr.push(gets.chomp.split.map(&:to_i)) }

for i in 0...n
    puts arr[i].sum
end


# 整数 N が与えられるので、次の処理を N 回してください。
# ・ 配列のサイズ K とその要素 A1 ... AK が与えられるので、全ての要素の和を求めて出力してください。

n = gets.to_i

n.times do
    arr = gets.split.map(&:to_i)
    arr.shift
    puts arr.sum
end


# 整数 N が与えられるので、次の規則に従って N 行の出力をしてください。
# ・ N 行のうち、 i 行目では、1 から i までの数字を半角スペース区切りで出力してください。

n = gets.to_i

for i in 1..n do
    arr = []
    for j in 1..i do
        arr.push(j)
    end
    puts arr.join(' ')
end


# 配列 A と B についての情報が与えられるので、(A の 1 つの要素) × (B の 1 つの要素) の最大値を求めてください。
# ・ 1 行目では、配列 A の要素数を表す整数 N と配列 B の要素数を表す整数 K が半角スペース区切りで与えられます。
# ・ 2 行目では、配列 A の各要素が半角スペース区切りで与えられます。
# ・ 3 行目では、配列 B の各要素が半角スペース区切りで与えられます。

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

ans = -10000
for i in 0...n
    for j in 0...k
        if a[i] * b[j] > ans
            ans = a[i] * b[j]
        end
    end
end

puts ans


# N 行 K 列の行列 A の i 行 j 列 の要素 A_ij を A_ji とした K 行 N 列の行列を元の配列 A の転置行列と言います。
# 例として、

# 1 2 3
# 4 5 6
# 7 8 9

# の転置行列は

# 1 4 7
# 2 5 8
# 3 6 9

# です。

# 行列 A についての情報が与えられるので、A の転置行列を出力してください。

n, k = gets.split.map(&:to_i)
arr = []

n.times { arr.push(gets.chomp.split.map(&:to_i)) }

arr2 = Array.new(k) { Array.new(n) }
for i in 0...n
    for j in 0...k
        arr2[j][i] = arr[i][j]
    end
end

for i in 0...k
    puts arr2[i].join(' ')
end

# 模範解答

n, k = gets.split.map(&:to_i)
a = []
n.times do
    a << gets.split.map(&:to_i)
end

for i in 0...k
    for j in 0...n
        print "#{a[j][i]} "
    end
    puts
end


# 配列 A の要素数 N とその要素 A_i (1 ≦ i ≦ N) が与えられるので、A についてのかけ算表 B を出力してください。かけ算表は N * N の二次元配列の形式とし、B の i 行 j 列の要素 B_ij について、B_ij = Ai * Aj (1 ≦ i , j ≦ N) が成り立つものとします。
# 例として、A = [1,2,3] のとき B は

# 1 2 3
# 2 4 6
# 3 6 9

# となります。

n = gets.to_i
arr = gets.split.map(&:to_i)

ans = Array.new(n) { Array.new(n) }
for i in 0...n
    for j in 0...n
        ans[i][j] = arr[i] * arr[j]
    end
end

for i in 0...n
    puts ans[i].join(' ')
end


# 整数 N が与えられるので、2 以上 N 以下の素数の個数を求めてください。
# エラトステネスの篩というアルゴリズムを用いると高速に求めることができます。

n = gets.to_i
arr = []
for i in 2..n do
    arr.push(i)
end

for i in 2..n do
    for j in 2..n do
        if i * j <= n
            arr.delete(i * j)
        end
    end
end

puts arr.length


# 整数 N が与えられるので、1 × 2 × ... × (N-1) × N を最大で何回 2 で割ることができるかを求めてください。

n = gets.to_i

num = 1
for i in 1..n do
    num *= i
end

count = 0
while num % 2 == 0
    num /= 2
    count += 1
end

puts count


# 普通の鳩時計は 1 時間に 1 回しか鳴かないのでつまらないと思ったあなたは、鳩時計を改造してスーパー鳩時計を作りました。
# このスーパー鳩時計は時刻が x 時 y 分のとき x + y が 3の倍数のとき"FIZZ"、5 の倍数のとき"BUZZ", 3の倍数かつ5の倍数のとき "FIZZBUZZ" と鳴き、
# これらのいずれにも当てはまらなかった場合は鳴きません。なお、0 は 3 の倍数かつ 5 の倍数であるとします。 
# 0 時 0 分 〜 23 時 59 分 の各分のスーパー鳩時計の様子を出力してください。

for h in 0..23
    for m in 0..59
        hm = h + m
        if hm % 15 == 0
            puts "FIZZBUZZ"
        elsif hm % 3 == 0
            puts "FIZZ"
        elsif hm % 5 == 0
            puts "BUZZ"
        else
            puts 
        end
    end
end