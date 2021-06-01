module YARD::CodeObjects::Cucumber
  class Feature < NamespaceObject
    attr_accessor :background, :comments, :description, :keyword, :rules, :scenarios, :tags, :value

    def total_scenarios
      scenarios.count
    end

    def total_rules
      rules.count
    end

    def initialize(namespace, name)
      @comments = ""
      @rules = []
      @scenarios = []
      @tags = []
      super(namespace, name.to_s.strip)
    end
  end
end
