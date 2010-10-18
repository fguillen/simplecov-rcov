require "#{File.dirname(__FILE__)}/helper"

class SimplecovRcovFormatterTest < Test::Unit::TestCase
  def test_format
    SimpleCov.stubs( :coverage_path ).returns( "/tmp" )
    SimpleCov::Formatter::RcovFormatter.stubs( :path_result ).returns( 'rcov/coverage_test_index.html' )
    if File.exists?( SimpleCov::Formatter::RcovFormatter.path_result )
      File.delete( SimpleCov::Formatter::RcovFormatter.path_result )
    end
        
    @original_result = {
      source_fixture( 'sample.rb' )                             => [nil, 1, 1, 1, nil, nil, 1, 1, nil, nil],
      source_fixture( 'app/models/user.rb' )                    => [nil, 1, 1, 1, nil, nil, 1, 0, nil, nil],
      source_fixture( 'app/controllers/sample_controller.rb' )  => [nil, 1, 1, 1, nil, nil, 0, 0, nil, nil]
    }

    @result = SimpleCov::Result.new( @original_result )
    puts "XXX: @result: #{@result}"
    rcov_result = SimpleCov::Formatter::RcovFormatter.new().format( @result )
    
    # File.open( "#{File.dirname(__FILE__)}/fixtures/index_1.html", 'w' ) { |f| f.write rcov_result }
    
    # File.readlines( source_fixture( 'results.csv' ) ).each do |line|
    #   assert_match( line.gsub( /^"\./, '' ), csv_result )
    # end
    
    assert( File.exists?( SimpleCov::Formatter::RcovFormatter.path_result ) )
  end
    
  def source_fixture( filename )
    File.expand_path( File.join( File.dirname( __FILE__ ), 'fixtures', filename ) )
  end
end
