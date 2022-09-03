module Jekyll
  module QuoteFilter
    def quote(md)
      md.split('\n', -1).map {|s|
        "> #{s}"
      }.join('\n')
    end
  end
end

Liquid::Template.register_filter(Jekyll::QuoteFilter)
