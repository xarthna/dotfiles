require 'rspec/core/formatters/console_codes'

class QuickfixFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :dump_summary, :dump_failures

  def initialize(output)
    @output = output
  end

  def example_passed(notification) # ExampleNotification
    @output << wrap_color(".", :green)
  end

  def example_failed(notification)
    @output << "\n" + format(notification) + "\n"
  end

  def dump_failures(notification) # ExamplesNotification
    if notification.failed_examples.length > 0
      @output << "\n\n#{wrap_color('FAILING:', :red)}\n\t"
      @output << failed_examples_output(notification)
    end
  end

  def dump_summary(notification) # SummaryNotification
    @output << "\n\nFinished in #{notification.duration}."
  end

  private

  def failed_examples_output(notification)
    failed_examples_output = notification.failed_examples.map do |example|
      failed_example_output example
    end
    build_examples_output(failed_examples_output)
  end

  def build_examples_output output
    output.join("\n\n\t")
  end

  def failed_example_output(example)
    full_description = example.full_description
    location = example.location
    formatted_message = strip_message_from_whitespace(example.execution_result.exception.message)
    stack = strip_message_from_whitespace(example.execution_result.exception.backtrace.take(10).join("\n"))

    "#{wrap_color("#{full_description} - #{location}", :red)}\n #{formatted_message}\n #{stack}"
  end

  def strip_message_from_whitespace(msg)
    msg.split("\n").map {|m| wrap_color(m.strip, :red) }.join("\n#{add_spaces(10)}")
  end

  def add_spaces(n)
    " " * n
  end

  def wrap_color(str, color)
    RSpec::Core::Formatters::ConsoleCodes.wrap(str, color)
  end

  def format(notification)
    "#{wrap_color(" \n%s: ", :red)} \n%s" % [notification.example.location, strip_message_from_whitespace(notification.exception.message)]
  end
end
