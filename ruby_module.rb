



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

ここまでが大事なところ！









8.5 ミックスインについてもっと詳しく

(4)
------------------------------------------------------------------------------------------------
module Loggable
  def log(text)
    puts "[LOG} #{text}"
  end
end

class Product
  include Loggable

  def create_products(names)
    log 'create_products is called'
  end
end

Product.include?(Loggable)
# => true

Product.include_module
# => [Loggabe, Kernel]

Product.ancestors
# => [Product, Loggable, Object, Kernel, BasicObect]

------------------------------------------------------------------------------------------------


include先のメソッドを使うモジュール

(5)
------------------------------------------------------------------------------------------------
module Taggable
  def price_tag
    "#{price}円"
  end
end

class Product
  include Taggable

  def price
    1000
  end
end

product = Product.new
product.price_tag
# => "1000円"
------------------------------------------------------------------------------------------------

Rubyには上記のような、include先のクラスに特定のメソッドがあると過程して成り立っているモジュールがいくつかある。↓
（例えば(5)のコードでは、productクラスにpriceメソッドがあると仮定してTaggabeモジュールが成り立っている。）
  ①Enumerable
  ②Comparable
  ③Kernel


① Enumerableモジュール → [ map, select, find, count ]

  ・ハッシュ、配列、範囲などの繰り返し処理ができるクラスにincludeされているモジュール
  ・include先のクラスにeachメソッドがあれば使えるモジュール


② Comparebleモジュール → [ <, <=, ==, >, >=, between?]

  ・文字列や数値などの <=>演算子が実装されているクラスにincludeされているモジュール
  ・include先のクラスに <=>メソッドがあれば使えるメソッド


③Kernelモジュール → [ puts, p, print, require, loop ]

  ・最強のモジュール
  ・全クラスの頂点にいるObjectクラスがKernelモジュールをincludeしているから、
    Objectクラスを継承している全てのクラスがkernelモジュールを使えるようになる。

(6)
------------------------------------------------------------------------------------------------
class Object
  include Kernel
  # 省略
end

class String < Object
  # 省略
end

class User < Object
  # 省略
end
------------------------------------------------------------------------------------------------








p301 8.5.7
クラスやモジュール自身もオブジェクト（インスタンス）
→オブジェクト（インスタンス）であるということは、設計図であるclassが存在するということ。
→クラスやモジュールも、何かしらのクラスからインスタンス化されたものである。
  （多分Classクラスをインスタンス化したもの。）


(7)
------------------------------------------------------------------------------------------------
class Object
  include Kernel
  # 省略
end

class Module < Object
  # 省略
end

class Class < Module
  # 省略
end

class User < Object
  # 省略
end
------------------------------------------------------------------------------------------------

(8)
------------------------------------------------------------------------------------------------
class User
  # 省略
end

User.class
# => Class

Class.superclass
# => Module

Module.superclass
# => Object



ちなみに、どんなクラスも最終的にClassクラスのオブジェクトになります。
Class.class
# => Class

Module.class
# => Class

Object.class
# => Class
------------------------------------------------------------------------------------------------