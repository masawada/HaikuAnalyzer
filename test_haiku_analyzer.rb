require_relative './haiku_analyzer.rb'
require 'test/unit'

class TestHaikuAnalyzer < Test::Unit::TestCase
  def setup
    @analyzer = HaikuAnalyzer.new

    @haiku = [
      '古池や蛙飛びこむ水の音',
      'さみだれや大河を前に家二軒',
      '柿くへば鐘が鳴るなり法隆寺',
      '月はやし梢は雨を持ちながら',
      '山吹も菜の花も咲く小庭哉',
      '柿くふも今年ばかりと思ひけり',
      '松島や ああ松島や 松島や',
      '五月雨を集めて早し最上川'
    ]

    @not_haiku = [
      'ハイクを詠め。カイシャクしてやる',
      '金をくれ',
      'ジャスミンティーおいしい',
    ]
  end

  def test_haiku
    @haiku.each do |haiku|
      assert(@analyzer.parse(haiku), "It should be haiku: #{haiku}")
    end
  end

  def test_not_haiku
    @not_haiku.each do |not_haiku|
      assert(!@analyzer.parse(not_haiku), "It should NOT be haiku: #{not_haiku}")
    end
  end
end
