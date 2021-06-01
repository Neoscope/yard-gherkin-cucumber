module YARD::CodeObjects::Cucumber
  class Tag < NamespaceObject

    attr_accessor :value, :owners, :total_scenarios, :total_rules

    def features
      @owners.find_all { |owner| owner.is_a?(Feature) }
    end

    def scenarios
      all = @owners.find_all do |owner|
        owner.is_a?(Scenario) || owner.is_a?(ScenarioOutline) || ()
      end

      @owners.each do |owner|
        if owner.is_a?(ScenarioOutline::Examples) && !all.include?(owner.scenario)
          all << owner.scenario
        end
      end
      all
    end

    def indirect_scenarios
      @owners.find_all { |owner| owner.is_a?(Feature) }.collect { |feature| feature.scenarios }.flatten
    end

    def all_scenarios
      scenarios + indirect_scenarios
    end

    def rules
      @owners.find_all { |owner| owner.is_a?(Rule) }
    end
  end
end
