



module Greeter
  def hello
    puts 'hello'
  end
end

class Greeter
  def hello
    puts 'hello'
  end
end

moduleとclassの違い  (例：p284の下の方)
  ・moduleはインスタンス化ができない。
  ・他のモジュールやクラスを継承することができない。



いつmoduluを使うのか
  ①継承を使わずにクラスにインスタンスメソッドを追加、上書きする時（include）
  ②複数のクラスに対して共通の特異メソッド（クラスメソッド）を追加する時 （extend）












①継承を使わずにクラスにインスタンスメソッドを追加、上書きする時（include）
→異なる複数のクラスに共通の処理がある + is-aの関係が成り立たずクラスの継承ができない時。
DRYみたいなもの

(1)
------------------------------------------------------------------------------------------------
class Product
  def title
    log 'title is called'
    'A great movie'
  end

  def log(text)
    puts "[LOG] #{text}"
  end
end

class User
  def name
    log 'name is called'
    'Alice'
  end

  def log(text)
    puts "[LOG] #{text}"
  end
end

product = Product.new
product.title
# => [LOG] title is called.
#    "A great movie"

user = User.new
user.name
# => [LOG] name is called.
#    "Alice"
------------------------------------------------------------------------------------------------

(2)
------------------------------------------------------------------------------------------------
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  include Loggable

  def title
    log 'title is called'
    'A great movie'
  end
end

class User
  include Loggable

  def name
    log 'name is called'
    'Alice'
  end
end

product = Product.new
product.title
# => [LOG] title is called.
#    "A great movie"

user = User.new
user.name
# => [LOG] name is called.
#    "Alice"
------------------------------------------------------------------------------------------------
(1) == (2)





②複数のクラスに対して共通の特異メソッド（クラスメソッド）を追加する時 （extend）

(3)
------------------------------------------------------------------------------------------------
module Loggable
  def log(text)
    puts "[LOG} #{text}"
  end
end

class Product
  extend Loggable

  def self.create_products(names)
    log 'create_products is called'
  end
end

Product.create_products([])
# => [LOG] create_products is called

Product.log('Hello.')
# => [LOG] Hello.
------------------------------------------------------------------------------------------------
moduleで定義したメソッドをインスタンスメソッドとして使いたいなら -> include
moduleで定義したメソッドをクラスメソッドとして使いたいなら -> extend

以上までが大事なところ








