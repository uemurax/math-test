module Jekyll
  module ErrorFilter
    def error(message)
      file = @context.registers[:page]['path']
      raise "Error in #{file}: #{message}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::ErrorFilter)
