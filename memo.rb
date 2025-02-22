require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i

if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください"
    memo_file_name = gets.chomp
    puts "メモしたい内容を入力してください"
    puts "入力が完了したらCtrl + D を押してください"
    memo_text = readlines(chomp: true)
    CSV.open("#{memo_file_name}.csv", "w") do |csv|
    csv << [memo_text]
    end

    puts "CSVファイルを作成しました。"

elsif memo_type == 2
    puts "編集したいファイル名（拡張子を除く）を入力してください"
    memo_file_name = gets.chomp
    puts "メモしたい内容を入力してください"
    puts "入力が完了したらCtrl + D を押してください"
    memo_text = readlines(chomp: true)
    CSV.open("#{memo_file_name}.csv", "a") do |csv|
    csv << [memo_text]
    end

    puts "CSVファイルにデータを追記しました。"
      
else
    puts "不正な値です"
end