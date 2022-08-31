module Jekyll
  module NodeFilter
    def node_numbering(data)
      label = data['clicks'].reduce('') { |s, tick|
        num = tick['value'] + 1
        s + case tick["clicker"]
            when "section" then ".#{num}"
            when "result" then "-#{num}"
            else ""
            end
      }
      label[1..]
    end

    def node_url(data)
      Liquid::Template.parse("{{ \"#{data['url']}\" | relative_url }}").render(@context)
    end

    def node_ref_nolink(data)
      node_numbering(data)
    end

    def node_ref(data)
      "<a href='#{node_url(data)}'>#{node_ref_nolink(data)}</a>"
    end

    def node_cref_nolink(data)
      "#{data['genus']} #{node_ref_nolink(data)}"
    end

    def node_cref(data)
      "<a href='#{node_url(data)}'>#{node_cref_nolink(data)}</a>"
    end

    def node_has_title?(data)
      data['title'] != data['slug'].downcase
    end

    def node_fullref_nolink(data)
      node_cref_nolink(data) + (node_has_title?(data) ? ": #{data['title']}" : '')
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
