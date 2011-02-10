class SimpleCov::Formatter::RcovFormatter
  PATH_RESULT = "/rcov/index.html"

  def format( result )
    @files = result.files

    @total_lines =  result.files.map { |e| e.lines.count }.inject(:+)
    @total_lines_code =  result.files.map { |e| e.covered_lines.count + e.missed_lines.count }.inject(:+)
    @total_coverage = coverage(result.files)

    template = ERB.new( File.read( "#{File.dirname(__FILE__)}/../views/index.erb.html" ) )
    rcov_result = template.result( binding )

    FileUtils.mkdir_p( File.dirname( SimpleCov::Formatter::RcovFormatter.path_result ) )

    File.open( SimpleCov::Formatter::RcovFormatter.path_result, "w" ) do |file_result|
     file_result.write rcov_result
    end

    puts "Coverage report Rcov style generated for #{result.command_name} to #{SimpleCov::Formatter::RcovFormatter.path_result}"

    return rcov_result
  end

  private

  def lines_covered(file_list)
    return 0.0 if file_list.length == 0
    file_list.map {|f| f.covered_lines.count }.inject(&:+)
  end

  def lines_missed(file_list)
    return 0.0 if file_list.length == 0
    file_list.map {|f| f.missed_lines.count }.inject(&:+)
  end

  def lines_of_code(file_list)
    lines_missed(file_list) + lines_covered(file_list)
  end

  def coverage(file_list)
    return 100.0 if file_list.length == 0 or lines_of_code(file_list) == 0
    lines_missed = file_list.map {|f| f.missed_lines.count }.inject(&:+)

    lines_covered(file_list) * 100 / lines_of_code(file_list).to_f
  end

  def self.path_result
    File.join( SimpleCov.coverage_path, SimpleCov::Formatter::RcovFormatter::PATH_RESULT )
  end
end
