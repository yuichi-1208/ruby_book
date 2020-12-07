# p.353 9.6 例外処理についてもっと詳しく

# ensure節
begin
  例外が発生するかもしれない処理
rescue
  例外発生時の処理
ensure
  例外の有無に関わらず実行する処理
end

________________________________________________________________________________________________

begin
  1/1
rescue ZeroDivisionError
  puts 'ZeroDivisionError'
ensure
  puts '例外の有無に関わらず実行する'
end
# => 例外の有無に関わらず実行する

begin
  1/0
rescue ZeroDivisionError
  puts 'ZeroDivisionError'
ensure
  puts '例外の有無に関わらず実行する'
end
# => ZeroDivisionError
#    例外の有無に関わらず実行する
__________________________________________________________________________________________________








# else節
begin
  例外が発生するかもしれない処理
rescue
  例外発生時の処理
else
  例外が発生しなかった場合の処理
ensure
  例外の有無に関わらず実行する処理
end

________________________________________________________________________________________________

begin
  puts 'Hello'
rescue
  puts '例外が発生しました。'
else
  puts '例外は発生しませんでした。'
end
# => Hello
#    例外は発生しませんでした。

begin
  puts 'Hello'
  puts '例外は発生しませんでした。'
rescue
  puts '例外が発生しました。'
end
# => Hello
#    例外は発生しませんでした。


# 違いは、else節の中で実行されたコードはエラーが起きてもrescue節で捕捉さらない
________________________________________________________________________________________________








# 例外処理と戻り値

________________________________________________________________________________________________

def some_method(n)
  begin
    1/n
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end
end

some_method(1)
# => "OK"
some_method(0)
# => "error"


# ensure書く意味なくね？ => returnを使った場合、ensureの効果（例外の有無に関わらず実行する）を発揮
def some_method(n)
  begin
    1/n
    'OK'
  rescue
    'error'
  ensure
  # ensure節にreturnを書く
    return 'ensure'
  end
end

some_method(1)
# => "ensure"
some_method(0)
# => "ensure"


# 非常にわかりづらい不具合の原因になるので、ensure節ではreturnを使わないようにしましょう。
________________________________________________________________________________________________










# begin/endを省略するrescue修飾子

例外が発生しそうな処理 rescue 例外が発生した時の戻り値

________________________________________________________________________________________________
# RubyにおけるDateクラスは日付を扱うクラス。
# そのDateクラスのparseメソッドは文字列による日付を、Dateオブジェクトに変換させるメソッド。

require 'date'

def to_date(string)
  begin
    Date.parse(string)
  rescue ArgumentError
    nil
  end
end

to_date('2020-12-08')
# => #<Date: 2020-12-08 ((2459192j,0s,0n),+0s,2299161j)>
to_date('abcdef')
# => nil


# (次の項目)
# メソッドの中身全体が例外処理で囲まれている（beginとrescueで囲まれている）場合は、beginとendを省略できる
def to_date(string)
  Date.parse(string)
rescue ArgumentError
  nil
end

# rescue修飾子を使う

def to_date(string)
  Date.parse(string) rescue nil
end

to_date('2020-12-08')
# => #<Date: 2020-12-08 ((2459192j,0s,0n),+0s,2299161j)>
to_date('abcdef')
# => nil

# rescue修飾子を使う場合、捕捉する例外クラスを指定することができない（StandardErrorとそのサブクラスが指定される）
_________________________________________________________________________________________________________________










# 例外処理のbegin/endを省略できるケース
# メソッドの中身全体が例外処理で囲まれている（beginとrescueで囲まれている）場合は、beginとendを省略できる
________________________________________________________________________________________________

def fizz_buzz(n)
  begin
    if n % 15 == 0
      'Fizz Buzz'
    elsif n % 3 == 0
      'Fizz'
    elsif n % 5 == 0
      'Buzz'
    else
      n.to_s
    end
  rescue => e
    puts "#{e.class} #{e.message}"
  end
end

fizz_buzz(nil)
#=> NoMethodError undefined method `%' for nil:NilClass


def fizz_buzz(n)
  if n % 15 == 0
    'Fizz Buzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
rescue => e
  puts "#{e.class} #{e.message}"
end

fizz_buzz(nil)
#=> NoMethodError undefined method `%' for nil:NilClass
________________________________________________________________________________________________











# 独自の例外クラスを定義する

________________________________________________________________________________________________

class NoCountryError < StandardError
  # 独自のクラス名を与えるのが目的なので、実際のコードは書かない（継承だけで済ませる）
end

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 独自に定義したNoCountryErrorを発生させる
    raise NoCountryError, "無効な国名です。 #{country}"
  end
end

currency_of(:italy)
# NoCountryError: 無効な国名です。 italy

# irbでやってみるとおもろい
________________________________________________________________________________________________






