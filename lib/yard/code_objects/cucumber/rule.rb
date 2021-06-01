module YARD::CodeObjects::Cucumber
  class Rule < NamespaceObject
    attr_accessor :comments, :description, :keyword, :scenarios, :tags, :value

    def total_scenarios
      scenarios.count
    end

    def initialize(namespace, name)
      @description = @keyword = @value = @feature = nil
      @comments = ""
      @scenarios = []
      @tags = []
      super(namespace, name.to_s.strip)
    end
  end
end
