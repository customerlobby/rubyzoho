require 'rexml/document'

module ApiUtils

  def self.camelize_with_space(str)
    str.split('_').map {|w| w.capitalize}.join(' ')
  end

  def self.string_to_method_name(s)
    s.gsub(' ', '_').downcase
  end

  def self.string_to_symbol(s)
    s = convert_digit_to_word(s) if s.match /^[0-9]/
    s.gsub!(/[()%]*/, '')
    s.gsub(' ', '_').downcase.to_sym
  end

  def self.convert_digit_to_word(s)
    digit = s.match /^[0-9]/
    case digit[0]
    when '0'
      s.gsub!('0','zero')
    when '1'
      s.gsub!('1','one')
    when '2'
      s.gsub!('2','two')
    when '3'
      s.gsub!('3','three')
    when '4'
      s.gsub!('4','four')
    when '5'
      s.gsub!('5','five')
    when '6'
      s.gsub!('6','six')
    when '7'
      s.gsub!('7','seven')
    when '8'
      s.gsub!('8','eight')
    when '9'
      s.gsub!('9','nine')
    end
    return s
  end

  def self.symbol_to_string(sym)
    sym.class == Symbol ? self.camelize_with_space(sym.to_s) : self.camelize_with_space(sym)
  end

end
