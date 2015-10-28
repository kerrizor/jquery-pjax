require 'colorize'
require 'english'

class GitRunner
  def branch(flags = '-a')
    branch_command_output = `gitd branch #{flags} 2>&1`

    format_output(branch_command_output)
  end

  private

  def format_output(output)
    return formatted_error(output) unless $CHILD_STATUS.success?

    output
  end

  def formatted_error(error_str)
    output =  "There was an error!\n".colorize(:red).underline
    output << error_str
  end
end

puts GitRunner.new.branch
