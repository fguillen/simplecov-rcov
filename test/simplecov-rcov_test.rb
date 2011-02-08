require "#{File.expand_path(File.dirname(__FILE__))}/helper"

class SimplecovRcovFormatterTest < Test::Unit::TestCase
  def test_format
    SimpleCov::Formatter::RcovFormatter.stubs( :path_result ).returns( '/tmp/rcov/coverage_test_index.html' )
    if File.exists?( SimpleCov::Formatter::RcovFormatter.path_result )
      File.delete( SimpleCov::Formatter::RcovFormatter.path_result )
    end

    # Sets the number of lines of source we generate.
    # If you change it from 900, you'll need to edit the fixtures appropriately.
    # The number should always be evenly divisible by 3 and the coverage percentage
    # will always be 50%.
    source_lines_count = 900

    fixtures = ['sample.rb', 'app/models/user.rb', 'app/controllers/sample_controller.rb']
    @original_result = {}
    fakeroot = '/fake'
    fixtures.each do |fixture|
      @original_result[File.join(fakeroot, fixture)] = generate_coverage_results(source_lines_count)
      fixture_source_lines = generate_source_lines(fixture, source_lines_count)
      File.stubs(:readlines).with(File.join(fakeroot, fixture)).returns(fixture_source_lines)
      SimpleCov.stubs(:root).returns(fakeroot)
    end

    @result = SimpleCov::Result.new( @original_result )
    rcov_result = SimpleCov::Formatter::RcovFormatter.new().format( @result )

    assert_match( File.read( "#{File.dirname(__FILE__)}/fixtures/totals_tr.html"), rcov_result )
    assert_match( File.read( "#{File.dirname(__FILE__)}/fixtures/file_tr.html"), rcov_result )
    assert( File.exists?( SimpleCov::Formatter::RcovFormatter.path_result ) )
  end

  def generate_coverage_results(num_lines)
    result_types = [nil, 0, 1]
    each_result_count = num_lines / 3
    results = []
    each_result_count.times do
      results += result_types
    end
    rand_results = []
    results.count.times do
      idx = rand_between(0, results.count-1)
      rand_results << results.delete_at(idx)
    end
    rand_results
  end

  def rand_between(min, max)
    min + rand(max-min)
  end

  def generate_source_lines(template, num_lines)
    template_lines = File.read(source_fixture(template)).split("\n")
    source_lines = []
    num_lines.times { source_lines << template_lines.sample }
    source_lines
  end

  def source_fixture( filename )
    File.expand_path( File.join( File.dirname( __FILE__ ), 'fixtures', filename ) )
  end
end
