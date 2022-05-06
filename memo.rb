require "csv"

puts "【1(新規でメモを作成) 2(既存のメモ編集する)】"
memo_type = gets.to_s.chomp

if memo_type == "1"
  puts "【拡張子を除いた保存したいファイル名を入力してください。】"
  file_name_create = gets.to_s.chomp

  puts "【メモしたい内容を入力してください。】"
  puts "【入力が終わったらCtrl+Dを押してください。】"
  new_input = $stdin.read

  CSV.open(file_name_create + ".csv",'w') {|csv| csv << [new_input] }

elsif memo_type == "2"
  puts "【現在のディレクトリにある編集可能なファイルは以下のとおりです。】"
  puts "-------------------------"
  Dir.glob('*.csv').sort.each {|d| puts d.gsub(/.csv/,'')}
  puts "-------------------------"

  puts "【編集したいファイル名を入力してください。】"
  file_name_edit = gets.to_s.chomp

  puts "【入力されたファイルの内容は以下のとおりです】"
  edit_file_content = CSV.read(file_name_edit + ".csv")
  puts "-------------------------"
  puts edit_file_content
  puts "-------------------------"

  puts "【1(上書きして編集) 2(メモを末尾に追記)】"
  edit_type = gets.to_s.chomp

    if edit_type == "1"
      puts "【上書きしたい内容を入力してください。】"
      puts "【入力が終わったらCtrl+Dを押してください。】"
      edit_input_1 = $stdin.read
      CSV.open(file_name_edit + ".csv",'w') {|csv| csv << [edit_input_1] }

    elsif edit_type == "2"
      puts "【末尾に追記したい内容を入力してください。】"
      puts "【入力が終わったらCtrl+Dを押してください。】"
      edit_input_2 = $stdin.read
      CSV.open(file_name_edit + ".csv",'a') {|csv| csv << [edit_input_2] }

    else
      puts "【入力が不正です。】"

  end

else
  puts "【入力が不正です。】"

end
