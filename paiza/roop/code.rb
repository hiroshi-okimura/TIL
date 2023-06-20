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