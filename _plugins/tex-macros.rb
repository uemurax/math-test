class TeXMacros
  DEFAULTS = {}

  def self.to_antex_macros(macros)
    macros.reduce("") {|s, (key, d)|
      nargs = d['nargs']
      body = d['body']
      s + "\\newcommand#{key}[#{nargs}]{#{body}}"
    }
  end

  def self.to_katex_macros(macros)
    macros.reduce({}) {|h, (key, d)|
      h.merge({key => d['body']})
    }
  end

  def self.hook(site)
    macros = DEFAULTS.merge(site.config['tex_macros'] || {})

    antex_preamble = site.config.dig('antex', 'preamble') || ""
    katex_macros = site.config.dig('katex', 'macros') || {}

    config = {
      'antex' => {
        'preamble' => antex_preamble + to_antex_macros(macros)
      },
      'katex' => {
        'macros' => katex_macros.merge(to_katex_macros(macros))
      }
    }
    Jekyll::Utils.deep_merge_hashes!(site.config, config)
  end
end

Jekyll::Hooks.register :site, :after_init do |site|
  TeXMacros.hook(site)
end
