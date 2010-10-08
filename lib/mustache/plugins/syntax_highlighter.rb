require 'albino'

class Mustache
  module Plugins
    module SyntaxHighlighter

      HIGHLIGHT = 'highlight_'

      def respond_to?(id)
        id.to_s.start_with? HIGHLIGHT ? true : super
      end

      def method_missing(id)
        name = id.to_s
        if name.start_with? HIGHLIGHT
          lexer = name[HIGHLIGHT.size .. -1]
          lambda { |text| render Albino.new(text, lexer) }
        else
          super
        end
      end

    end
  end
end
