Mustache Syntax Highlighter
===========================

A plugin for [mustache.rb][mr] that lets you syntax highlight blocks
of code using sections.

## Syntax

You can to highlight a piece of code by wrapping text in a section whose
name starts with `highlight_` followed by the lexer's name.

  `{{# highlight_lexer}} code {{/ highlight_lexer}}`

To see the complete list of available lexers [click here][lx].

For example, to activate the ruby lexer, use this template:

    {{# highlight_ruby}}
    def hello
      puts "Hi world!"
    end
    {{/ highlight_ruby}}

Will produce this text:

    <div class="highlight"><pre><span class="k">def</span> <span class="nf">hello</span>
      <span class="nb">puts</span> <span class="s2">&quot;Hi world!&quot;</span>
    <span class="k">end</span>
    </pre></div>

Just include the [Pygments css file][pc] and you're ready to roll.

## Usage

If you want to use this in a `Mustache` view you can include it in
your subclass:

    class BlogPost < Mustache
      include Mustache::Plugins::SyntaxHighlighter

      def name
        "Bobs"
      end
    end

The code you want to highlight will be rendered before being passed to
the highlighter.

So this:

    {{# highlight_ruby}}
    def hello
      puts "Hi {{name}}!"
    end
    {{/ highlight_ruby}}

Becomes this:

    <div class="highlight"><pre><span class="k">def</span> <span class="nf">hello</span>
      <span class="nb">puts</span> <span class="s2">&quot;Hi Bobs!&quot;</span>
    <span class="k">end</span>
    </pre></div>

Note the `Hi Bobs!`

## Dependencies

* Pygments
* Mustache 0.11.0

[mr]: http://github.com/defunkt/mustache
[pc]: http://pygments.org/media/pygments_style.css
[lx]: http://pygments.org/docs/lexers/
