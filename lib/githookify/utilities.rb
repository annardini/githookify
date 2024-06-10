require 'colorize'

module Githookify
  class Utilities
    def self.log(text, color = :default)
      color == :default ? puts(text) : puts(text.colorize(color))
    end
  end
end
