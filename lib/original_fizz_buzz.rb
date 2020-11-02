def fizz_buzz()
  i = 0

  while i < 3
    puts "数字を入力してください"
    n = gets.to_i
    if n % 15 == 0
     puts 'Fizz Buzz'
    elsif n % 3 == 0
     puts 'Fuzz'
    elsif n % 5 == 0
     puts 'Buzz'
    else
     puts n.to_s
    end
    i += 1
    puts "#{i}回目←3回まで繰り返されます。"
     if i == 3
       puts "終了です。ありがとうございました！"
     end
  end
end

# puts fizz_buzz(1)
# puts fizz_buzz(2)
# puts fizz_buzz(3)
# puts fizz_buzz(4)
# puts fizz_buzz(5)
# puts fizz_buzz(6)
# puts fizz_buzz(15)
fizz_buzz()
