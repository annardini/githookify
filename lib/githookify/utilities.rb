require 'colorize'

module Githookify
  class Utilities
    def self.log(str, color)
      output = str.send(color)
      puts output
    end
  end
end
