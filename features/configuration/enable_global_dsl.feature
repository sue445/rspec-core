Feature: Global namespace DSL

  Tell RSpec to expose the DSL via the global namespace

  Scenario: by default RSpec allows the top level monkey patching
    Given a file named "spec/example_spec.rb" with:
      """ruby
      describe "specs here" do
        it "passes" do
        end
      end
      """
   When I run `rspec`
   Then the output should contain "1 example, 0 failures"

  Scenario: when exposing globally is disabled top level dsl no longer works
    Given a file named "spec/example_spec.rb" with:
      """ruby
      RSpec.configure { |c| c.expose_globally = false }
      describe "specs here" do
        it "passes" do
        end
      end
      """
   When I run `rspec`
   Then the output should contain "undefined method `describe'"

  Scenario: regardless of setting
    Given a file named "spec/example_spec.rb" with:
      """ruby
      RSpec.configure { |c| c.expose_globally = true }
      RSpec.describe "specs here" do
        it "passes" do
        end
      end
      """
   When I run `rspec`
   Then the output should contain "1 example, 0 failures"
