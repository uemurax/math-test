module Jekyll
  module NodeFilter
    def node_numbering(data)
      label = ""
      data['clicks'].each do |tick|
        num = tick['value'] + 1
        label << case tick["clicker"]
                 when "section" then ".#{num}"
                 when "result" then ":#{num}"
                 else ""
                 end
      end
      label[1..]
    end

    def node_url(data)
      "#{@context.registers[:site].baseurl}#{data['url']}"
    end

    def node_ref(data)
      "<a href='#{node_url(data)}'>#{node_numbering(data)}</a>"
    end

    def node_cref(data)
      "<a href='#{node_url(data)}'>#{data['genus']} #{node_numbering(data)}</a>"
    end

    def node_fullref_nolink(data)
      "#{data['genus']} #{node_numbering(data)}: #{data['title']}"
    end

    def node_fullref(data)
      "<a href='#{node_url(data)}'>#{node_fullref_nolink(data)}</a>"
    end
  end

  module NodeUtil
    extend self

    def node_from_slug(site, slug)
      site.collections['nodes'].docs.detect { |doc| doc.data['slug'] == slug }
    end
  end

  class NodeTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      arr = text.split(' ', 2)
      @slug_exp = arr[0]
      @rest = arr[1]
    end

    def render(context)
      slug = Liquid::Template.parse("{{ #{@slug_exp} }}").render(context)
      node = NodeUtil.node_from_slug(context.registers[:site], slug)
      data = node.data
      data['url'] = "#{node.url}"
      key = 'node_data'
      old_data = context[key]
      context[key] = data
      result = template = Liquid::Template.parse("{{ #{key} #{@rest} }}").render(context)
      context[key] = old_data
      result
    end
  end
end

Liquid::Template.register_filter(Jekyll::NodeFilter)
Liquid::Template.register_tag('node', Jekyll::NodeTag)
