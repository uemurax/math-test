require 'git'

module GitLog
  class Generator < Jekyll::Generator
    DEFAULTS =
      {
        'path' => [],
      }

    def generate(site)
      g = Git.open(site.source)
      config = DEFAULTS.merge(site.config['git_log'] || {})
      log = g.log.path(config['path'])
      site.data['git_log'] = {}
      site.data['git_log']['commits'] = log.map { |commit|
        {
          'sha' => commit.sha,
          'date' => commit.date,
          'message' => commit.message,
        }
      }
    end
  end
end
