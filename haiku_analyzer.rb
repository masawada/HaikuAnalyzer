require 'natto'

class HaikuAnalyzer
  def initialize
    @nm = Natto::MeCab.new
  end

  def parse(text)
    count = 0
    section = [5, 7, 5]
    current_section = 0

    @nm.parse(text) do |n|
      next if n.surface.nil?
      notes = n.feature.split(",").last
      notes = notes.gsub(/(ャ|ュ|ョ)ン/, "ャ").gsub(/(ャ|ュ|ョ)/, "")
      count += notes.length
      return false if count > section[current_section]
      if count == section[current_section]
        count = 0
        current_section += 1
      end
    end

    return current_section == section.length
  end
end
