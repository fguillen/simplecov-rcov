class SimpleCov::Formatter::RcovFormatter
  PATH_RESULT = "/rcov/index.html"

  def format( result )
    @files = result.files

    @total_lines =  result.files.map { |e| e.lines.count }.inject(:+)
    @total_lines_code =  result.files.map { |e| e.covered_lines.count + e.missed_lines.count }.inject(:+)
    @total_coverage = result.covered_percent

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

    # Computes the coverage based upon lines covered and lines missed
    def self.total_coverage(file_list)
      return 100.0 if file_list.length == 0
      porcents_sum = file_list.map(&:covered_percent).reduce(&:+)
      result = porcents_sum / file_list.length

      return result
    end

    def self.path_result
      File.join( SimpleCov.coverage_path, SimpleCov::Formatter::RcovFormatter::PATH_RESULT )
    end
end
