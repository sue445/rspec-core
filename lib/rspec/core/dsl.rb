module RSpec

  # Generates a subclass of {ExampleGroup}
  #
  # ## Examples:
  #
  #     describe "something" do
  #       it "does something" do
  #         # example code goes here
  #       end
  #     end
  #
  # @see ExampleGroup
  # @see ExampleGroup.describe
  def self.describe(*args, &example_group_block)
    RSpec::Core::ExampleGroup.describe(*args, &example_group_block).register
  end

  module Core
    module DSL
    end
  end
end
