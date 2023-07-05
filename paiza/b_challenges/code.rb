あなたは今、とある戦略ゲームをプレイしています。
ゲームの中で、敵を攻撃するために、フィールドに爆弾を仕掛けました。
敵がフィールド内に入ったところで一気に爆弾を点火し、敵に攻撃をする寸法です。

フィールドは縦 H 行、横 W 行のマス目としてあらわされ、これらのマス目のうちのいくつかに爆弾が仕掛けてあります。
i 行目、j 列目の爆弾が爆発すると、i 行目全体と j 列目全体に爆風が広がります。

あなたはすでにフィールド上に爆弾を仕掛け終わりました。
フィールド上の爆弾を一気に点火した場合、いくつのマスに爆風が広がるかを計算してください。

h, w = gets.split.map(&:to_i)
arr = []
h.times { arr.push(gets.chomp.split('')) }


bakudan = []
for i in 0..h-1
    for j in 0..w-1
        if arr[i][j] == "#"
            bakudan.push("#{i} #{j}")
        end
    end
end

bakudan_num = bakudan.length

arr2 = []
bakudan.each do |obj|
    arr2.push(obj.split.map(&:to_i))
end


for i in 0...bakudan_num
  # 行に爆風を広げる
  w.times { |num| arr[arr2[i][0]][num] = "#" }

  # 列に爆風を広げる
  h.times { |num| arr[num][arr2[i][1]] = "#" }
end

count = arr.flatten.count("#")

puts count