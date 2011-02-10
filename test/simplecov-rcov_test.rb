require "#{File.expand_path(File.dirname(__FILE__))}/helper"

class SimplecovRcovFormatterTest < Test::Unit::TestCase
  def test_format
    SimpleCov::Formatter::RcovFormatter.stubs( :path_result ).returns( '/tmp/rcov/coverage_test_index.html' )
    if File.exists?( SimpleCov::Formatter::RcovFormatter.path_result )
      File.delete( SimpleCov::Formatter::RcovFormatter.path_result )
    end

    @original_result = {
      source_fixture( 'sample.rb' )                  => [nil, 1, 1, 1, nil, 0, 1, 1, nil, nil],
      source_fixture( 'app/models/user.rb' )         => [nil, 1, 1, 1, 1, 0, 1, 0, nil, nil],
      source_fixture( 'app/models/robot.rb' )        => [1, 1, 1, 1, nil, nil, 1, 0, nil, nil],
      source_fixture( 'app/models/house.rb' )        => [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
      source_fixture( 'app/models/airplane.rb' )     => [0, 0, 0, 0, 0],
      source_fixture( 'app/models/dog.rb' )          => [1, 1, 1, 1, 1],
      source_fixture( 'app/controllers/sample.rb' )  => [nil, 1, 1, 1, nil, nil, 0, 0, nil, nil]
    }

    @result = SimpleCov::Result.new( @original_result )
    rcov_result = SimpleCov::Formatter::RcovFormatter.new().format( @result )
    
    assert_match( File.read( "#{File.dirname(__FILE__)}/fixtures/totals_tr.html"), rcov_result )
    assert_match( File.read( "#{File.dirname(__FILE__)}/fixtures/file_tr.html"), rcov_result )
    assert( File.exists?( SimpleCov::Formatter::RcovFormatter.path_result ) )
  end

  def source_fixture( filename )
    File.expand_path( File.join( File.dirname( __FILE__ ), 'fixtures', filename ) )
  end
end
