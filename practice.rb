a = <<text
     これはヒアドキュメントです。
     複数行に渡る長い文字列を作成するのに便利です。
text
puts a

def some_mothod
<<text
 これはヒアドキュメントです
     複数行に渡る長い文字列を作成するのに便利です。
text
end
puts some_mothod

def some_mothod
 <<-text
               これはヒアドキュメントです
               複数行に渡る長い文字列を作成するのに便利です。
 text
end
puts some_mothod

def some_mothod
 <<~text
    これはヒアドキュメントです
    複数行に渡る長い文字列を作成するのに便利です。
                   text
end
puts some_mothod

puts "\u3042\u3044\u3046"
puts ?a

puts 0b11111111
puts 0b10

r = 2/3r #有理数クラスと判定される
r = 2/3 #整数クラスと判定される
puts r
puts r.class
puts r.class == Integer

user = "Alice" || "Bob" || "Carol"
user = "Alice" && "Bob" && "Carol"

puts user
