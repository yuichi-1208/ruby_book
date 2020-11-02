# 配列は,index番号で値を取得
# a = ['yen', 'dollar', 'rupee']
# puts a[0]

# puts '---------------------------------'
# ハッシュは、キー（自分でつけた名前）で値を取得する
# a = { japan: 'yen', us: 'doller', india: 'rupee'}
# puts a[:japan]



# p148,[5.2.1]

# ロケット記法（古い書き方）(文字列をハッシュのキーにする)
# currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
# currencies['italy'] = 'euro'
# puts currencies

# シンボルを使ったロケット記法
# currencies = { :japan => 'yen', :us => 'doller', :india => 'rupee' }
# currencies[:italy] = 'euro'
# puts currencies

# シンボル記法(実行速度が早い)（シンボルをハッシュのキーにする）(一番見慣れてるやつ)
# シンボルを使えば、「=>」はいらない,その際は、シンボルの位置が左から右に変わるので注意！
# currencies = { japan: 'yen', us: 'doller', india: 'rupee' }
# currencies[:italy] = 'euro'
# puts currencies

#キーも値もシンボル記法
# puts currencies = {japan: :yen, us: :doller, india: :rupee}
# puts currencies[:japan]
# currencies[:italy] = :euro
# puts currencies



# 既存の値を上書き
# currencies = { japan: 'yen', us: 'doller', india: 'rupee' }
# currencies[:japan] = '円'
# puts currencies

# 指定したキーに対応する値を取り出す
# currencies = { japan: 'yen', us: 'doller', india: 'rupee' }
# puts currencies[:us]

# 存在しないキーはnilが返る(irb上) → 何も値が返らない()
# puts currencies[:brazil]



# p149,[5.2.2]
#ブロック引数が2個の場合
# currencies = { japan: 'yen', us: 'doller', india: 'rupee' }
#
# currencies.each do |key, value|
#   puts "#{key} : #{value}"
# end

# ブロック引数が1つだと、キーと値が配列に格納される
# currencies = { japan: 'yen', us: 'doller', india: 'rupee' }
#
# currencies.each do |key_value|
#   p key_value
#   puts '----------------------------------'
# end



# p149[5.2.3]
# a = { x: 1, y: 2, z:3 }
# b = { x: 1, y: 2, z:3 }
# puts a == b

# 並び順が異なっていても、キーと値が全て同じなら
# a = { x: 1, y: 2, z: 3 }
# c = { z: 3, y: 2, x: 1 }
# puts a == c

# キーは同じであるが、一つでも値が異なれば
# a = { x: 1, y: 2, z: 3 }
# d = { x: 10, y: 2, z: 3 }
# puts a == d



# p150
# sizeメソッドを使うと要素の個数を調べることができます。
# a = { x: 1, y: 2, z: 3 }.size
# puts a
# b = { a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: 7, h:8, i: 9, j: 10}.size
# puts b

# deleteメソッドは、指定したキーに対応する要素を削除できる
# currencies = { japan: 'yen', us: 'doller', india: 'rupee' }
# a = currencies.delete(:japan)
# puts a
# puts currencies

# 指定したキーが存在しなければ、nilが返る
# currencies = { japan: 'yen', us: 'doller', india: 'rupee' }
# a = currencies.delete(:italy)
# puts a
# puts currencies

# ブロックを渡せばキーが見つからない時の（nilの時の）、戻り値を作成できる
# currencies = { japan: 'yen', us: 'doller', india: 'rupee' }
# a = currencies.delete('italy') {|key| "'#{key}'は、ハッシュの中に存在しません。"}
# puts a



#シンボル  [:]のこと
# p151, [5.3.1]
# シンボルクラスのオブジェクトと、ストリングクラスのオブジェクト
# puts :apple.class
# puts 'apple'.class

# シンボルは全く同じオブジェクトになる。
# puts :APPLE.object_id
# puts :apple.object_id
# puts :apple.object_id
#
# puts :apple.object_id == :apple.object_id
# puts '--------------------------------------'
#
# puts 'apple'.object_id
# puts 'apple'.object_id
# puts 'apple'.object_id
#
# puts 'apple'.object_id == 'apple'.object_id


# p152
# 文字列は、ミュータブルな（変更できる）オブジェクト,変数の中身が書き換えられる
# a = 'apple'
# puts a
# p a.upcase
#
# p a.upcase!
# puts a

# シンボルはイミュータブルな（変更できない）オブジェクト
# a = :apple
# puts a
# puts a.upcase




# p154~156 [5.4.3]
# メソッドのキーワード引数とハッシュ

# 引数が何を意味しているのかわかりづらい
# def buy_burger(menu, drink, potato)
#   puts "#{menu}バーガーをカゴに入れます。"
#   if drink
#     puts 'ドリンクをカゴに追加します。'
#   end
#   if potato
#     puts 'ポテトをカゴに追加します。'
#   end
# end
#
# buy_burger('cheese', true, true)
# puts '------------------------------------------'
# buy_burger('fish', true, false)


# 上記の2つ目と3つ目の引数が何を意味しているのかわかりづらいので、キーワード引数というものを使う
# キーワード引数とは、メソッドの引数にハッシュのキーを使うことができるので、可読性が上がる。
# def buy_burger(menu, drink: , potato: )
#   puts "#{menu}バーガーをカゴに入れます。"
#   if drink
#     puts 'ドリンクをカゴに追加します。'
#   end
#   if potato
#     puts 'ポテトをカゴに追加します。'
#   end
# end
#
# buy_burger('cheese', drink: true, potato: true)
# puts '------------------------------------------'
# buy_burger('fish', drink: true, potato: false)


# メソッドでキーワード引数にデフォルト値を設定しておけば、引数を省略できる。
# 省略した場合、デフォルト値が引数の役割をはたす
# 引数を省略しなかった場合、その指定した引数が有効になります
# def buy_burger(menu, drink: true , potato: true )
#   puts "#{menu}バーガーをカゴに入れます。"
#   if drink
#     puts 'ドリンクをカゴに追加します。'
#   end
#   if potato
#     puts 'ポテトをカゴに追加します。'
#   end
# end

# buy_burger('cheese')
# puts '-------------------------------------------'
# buy_burger('fish', drink: false, potato: false)


# デフォルト値が設定されていても引数に存在しないキーワード引数を指定した場合は、エラーになる。
# def buy_burger(menu, drink: true , potato: true )
#   puts "#{menu}バーガーをカゴに入れます。"
#   if drink
#     puts 'ドリンクをカゴに追加します。'
#   end
#   if potato
#     puts 'ポテトをカゴに追加します。'
#   end
# end
#
# buy_burger('bigmac', salada: true)


# キーワード引数を使うメソッドを使う場合、
# キーワード引数に一致するハッシュを指定すれば、それを引数にすることもできます
# def buy_burger(menu, drink: , potato:  )
#   puts "#{menu}バーガーをカゴに入れます。"
#   if drink
#     puts 'ドリンクをカゴに追加します。'
#   end
#   if potato
#     puts 'ポテトをカゴに追加します。'
#
#   end
# end
#
# params = { drink: true, potato: false}
# buy_burger( 'chicken', params)
