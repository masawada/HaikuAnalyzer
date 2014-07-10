require 'natto'

class HaikuAnalyzer
  def initialize
    @nm = Natto::MeCab.new
  end

  def parse(text)
    words = []
    sections = []
    current = 0
    syllabic_sound = [5, 7, 5]

    @nm.parse(text) { |n| words << n.feature.split(",").last unless n.surface.nil? }

    words.each do |word|
      return false if syllabic_sound[current].nil?
      sections[current] = "#{sections[current]}#{word}"
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
