require 'open3'

class GitRunner
  def branch
    output_str = ''

    Open3.popen2e("git branch -a 2>&1") do |stdin, output, wait_thr|
      while line = output.gets
        output_str << line
      end
    end

    output_str
  end
end

puts GitRunner.new.branch
