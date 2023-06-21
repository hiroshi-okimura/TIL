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