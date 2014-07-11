require 'natto'

class HaikuAnalyzer
  def initialize
    @nm = Natto::MeCab.new
  end

  def parse(text)
    phrases = []
    sections = []
    syllabic_sound = [5, 7, 5]

    current = 0
    @nm.parse(text) do |n|
      next if n.surface.nil?
      word_data = n.feature.split(",")
      current += 1 unless word_data[1].index("助詞") || word_data[1].index("助動詞")
      phrases[current] = "#{phrases[current]}#{word_data.last}"
    end
    phrases.compact!

    current = 0
    phrases.each do |phrase|
      return false if syllabic_sound[current].nil?
      sections[current] = "#{sections[current]}#{phrase}"
      current += 1 if sections[current].length >= syllabic_sound[current]
    end

    sections.each_with_index do |raw_section, i|
      section = raw_section.gsub(/(ァ|ィ|ゥ|ェ|ォ|ャ|ュ|ョ)/, "")
      next if section.size == syllabic_sound[i]
      return false unless section.gsub(/((ー|ン|ア|イ|ウ|エ|オ)\z)|/, "").size == syllabic_sound[i]
    end

    sections.size == syllabic_sound.length
  end
end
