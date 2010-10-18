class SimpleCov::Formatter::RcovFormatter
  PATH_RESULT = "/rcov/index.html"
  
  def format( result )
    @files = result.files
    
    @covered_percent = result.covered_percent
    @total_lines =  result.files.map(&:covered_percent).inject(:+) / files.count.to_f
    
    template = ERB.new( File.read( "#{File.dirname(__FILE__)}/../views/index.erb.html" ) )
    rcov_result = template.result( binding )
    
    FileUtils.mkdir_p( File.dirname( SimpleCov::Formatter::RcovFormatter.path_result ) )
    
    File.open( SimpleCov::Formatter::RcovFormatter.path_result, "w" ) do |file_result|
      file_result.write rcov_result
    end
    
    puts "Coverage report generated for #{result.command_name} to #{SimpleCov::Formatter::RcovFormatter.path_result}"
    
    return rcov_result
  end
  
  private
    
    def self.path_result
      File.join( SimpleCov.coverage_path, SimpleCov::Formatter::CSVFormatter::PATH_RESULT )
    end
end