require_relative './haiku_analyzer.rb'
require 'readline'

analyzer = HaikuAnalyzer.new

loop do
  buf = Readline.readline("> ", true).chomp
  case buf
  when "exit", "終了", "閉じる", "終わる", "フィニッシュ"
    puts "ハイク・アナライザを終了します"
    exit
  when "clear"
    system "clear"
  when ""
  else
    if analyzer.parse(buf)
      puts "これはハイクです"
    else
      puts "これはハイクではありません"
    end
  end
end
