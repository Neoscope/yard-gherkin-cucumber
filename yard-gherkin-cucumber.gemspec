require File.dirname(__FILE__) + "/lib/yard-gherkin-cucumber/version"

module YardGherkinCucumber
  def self.show_version_changes(version)
    date = ""
    changes = []
    grab_changes = false

    File.open("#{File.dirname(__FILE__)}/History.txt",'r') do |file|
      while (line = file.gets) do

        if line =~ /^===\s*#{version.gsub('.','\.')}\s*\/\s*(.+)\s*$/
          grab_changes = true
          date = $1.strip
        elsif line =~ /^===\s*.+$/
          grab_changes = false
        elsif grab_changes
          changes = changes << line
        end

      end
    end

    { :date => date, :changes => changes }
  end
end

Gem::Specification.new do |s|
  s.name        = 'yard-gherkin-cucumber'
  s.version     = ::YardGherkinCucumber::VERSION
  s.authors     = ["Pascal Beaudry (Neoscope Solution)","Franklin Webber"]
  s.description = %{
    yard-gherkin-cucumber is a YARD extension that processes Cucumber Features, Scenarios, Steps,
    Step Definitions, Transforms, and Tags and provides a documentation interface that allows you
    easily view and investigate the test suite.  This tools hopes to bridge the gap of being able
    to provide your feature descriptions to your Product Owners and Stakeholders.  }
  s.summary     = "Cucumber/Feature Features in YARD"
  s.email       = 'tbd@neoscope.info'
  s.homepage    = "http://github.com/neoscope/yard-gherkin-cucumber"
  s.license     = 'MIT'

  s.platform    = Gem::Platform::RUBY

  changes = YardGherkinCucumber.show_version_changes(::YardGherkinCucumber::VERSION)

  s.post_install_message = %{
(::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)

  Thank you for installing yard-gherkin-cucumber #{::YardGherkinCucumber::VERSION} / #{changes[:date]}.

  Changes:
  #{changes[:changes].collect{|change| "  #{change}"}.join("")}
(::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)

}

  #s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  s.add_development_dependency 'rdoc', '>= 6.3.1', '< 7.0'

  s.add_dependency 'webrick', '>= 1.6.1', '<= 1.7.0'

  # s.add_dependency 'cucumber-messages', '~> 8.0', '>= 9.0'
  # s.add_dependency 'gherkin', '>= 4.0', '< 9.0'
  # s.add_dependency 'cucumber', '>= 2.0', '< 6.1'

  # Dependence a évaluer pour remplacer les 4 précédent
  s.add_dependency 'cucumber-messages', '~> 16.0', '>= 16.0.1'
  s.add_dependency 'cucumber-gherkin', '~> 19.0', '>= 19.0.3'
  s.add_dependency 'cucumber', '>= 2.0', '< 6.1'

   # s.add_dependency 'yard', '~> 0.9', '>= 0.9.5'

  s.rubygems_version   = "3.2.18"
  s.files            = `git ls-files`.split("\n")
  s.extra_rdoc_files = %w[README.md History.txt]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"
end
