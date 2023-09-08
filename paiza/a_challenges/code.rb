A068

n, k, q = gets.chomp.split.map(&:to_i)

country = {}
n.times do |i|
    country[(i).to_s] = i
end


def arasoi(country, win_tiiki, lose_tiiki)
    if country.value?(country[lose_tiiki.to_s])
        ret = country.find_all {|k,v| v == country[lose_tiiki.to_s] }
    end
    
    ret.each do |tiiki, kuni|
        country[tiiki] = country[win_tiiki.to_s]
    end
end

k.times do
    arr = gets.chomp.split.map(&:to_i)
    win_tiiki = arr[0]
    lose_tiiki = arr[1]
    arasoi(country, win_tiiki, lose_tiiki)
end

q.times do
    puts country[gets.chomp]
end



A052

n = gets.to_i
a, b = gets.split.map(&:to_i)

# 到達可能な段を保存する配列
reachable = Array.new(n + 1, false)

# 最初は1段目にいるので、1段目は到達可能
reachable[1] = true

# 2段目からN段目までの各段について、到達可能かどうかを確認
(2..n).each do |i|
  # i段目に到達するためには、i-a段目またはi-b段目のどちらかに到達できる必要がある
  if i - a >= 1 && reachable[i - a]
    reachable[i] = true
  elsif i - b >= 1 && reachable[i - b]
    reachable[i] = true
  end
end

# 到達不可能な段の数をカウント
count = reachable.count(false) - 1 # 0番目の要素はカウントから除外

puts count
