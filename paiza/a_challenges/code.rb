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



