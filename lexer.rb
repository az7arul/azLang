require 'rltk/lexer'

module Azlang
  class Lexer < RLTK::Lexer
    
    # Skip whitespace
    rule(/\s/)
    
    # operators and delimiters
    rule(/\(/) { :LPAREN }
    rule(/\)/) { :RPAREN }
    rule(/;/) { :SEMI }
    rule(/,/) { :COMMA }
    rule(/\+/)	{ :PLUS   }
    rule(/-/)		{ :SUB    }
    rule(/\*/)	{ :MUL    }
    rule(/\//)	{ :DIV    }
    rule(/</)		{ :LT     }
    
    #Numeric
    
    rule(/\d+/) { |t| [:NUMBER, t.to_f] }
    
  end
end
