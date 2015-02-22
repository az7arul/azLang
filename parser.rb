
require 'rltk/parser'

# Tutorial Files
require './ast'

module Azlang
	class Parser < RLTK::Parser

		production(:input, 'statement SEMI') { |s, _| s }

		production(:statement) do
			clause('e')		{ |e| e }
		end

		production(:e) do

			clause('NUMBER')	{ |n| p "Number (#{n.inspect})"; Number.new(n)   }

			clause('e PLUS e')	{ |e0, _, e1| Add.new(e0, e1) }
			clause('e SUB e')	{ |e0, _, e1| Sub.new(e0, e1) }
			clause('e MUL e')	{ |e0, _, e1| Mul.new(e0, e1) }
			clause('e DIV e')	{ |e0, _, e1| Div.new(e0, e1) }
			clause('e LT e')	{ |e0, _, e1| LT.new(e0, e1)  }

		end


		finalize use: 'kparser.tbl'
	end
end
