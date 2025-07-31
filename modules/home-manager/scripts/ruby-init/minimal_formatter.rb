require 'rspec/core/formatters/base_formatter'

class MinimalFormatter < RSpec::Core::Formatters::BaseFormatter
  RSpec::Core::Formatters.register self,
                                   :example_group_started,
                                   :example_passed,
                                   :example_failed,
                                   :dump_summary

  GREEN = "\e[32m"
  RED   = "\e[31m"
  RESET = "\e[0m"

  def initialize(output)
    super
    @results = Hash.new { |h, k| h[k] = { passed: [], failed: [] } }
  end

  def example_passed(notification)
    group_key = full_group_description(notification.example)
    @results[group_key][:passed] << notification.example.description.strip
  end

  def example_failed(notification)
    group_key = full_group_description(notification.example)
    @results[group_key][:failed] << notification.example.description.strip
  end

  def dump_summary(summary)
    @results.each do |group, outcomes|
      output.puts "\n#{group}"
      unless outcomes[:passed].empty?
        output.puts "#{GREEN}  Passed:#{RESET}"
        outcomes[:passed].each { |desc| output.puts "#{GREEN}    - #{desc}#{RESET}" }
      end
      unless outcomes[:failed].empty?
        output.puts "#{RED}  Failed:#{RESET}"
        outcomes[:failed].each { |desc| output.puts "#{RED}    - #{desc}#{RESET}" }
      end
    end

    total = summary.example_count
    failed = summary.failure_count
    passed = total - failed

    output.puts
    output.puts "#{GREEN}Passed: #{passed}#{RESET}"
    output.puts "#{RED}Failed: #{failed}#{RESET}"
    output.puts "Total:  #{total}"
  end

  private

  def full_group_description(example)
    example.example_group.parent_groups
           .reverse
           .map(&:description)
           .reject(&:empty?)
           .join(' > ')
  end
end
