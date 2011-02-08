require "#{File.expand_path(File.dirname(__FILE__))}/helper"

class SimplecovRcovFormatterTest < Test::Unit::TestCase
  def test_format
    SimpleCov::Formatter::RcovFormatter.stubs( :path_result ).returns( '/tmp/rcov/coverage_test_index.html' )
    if File.exists?( SimpleCov::Formatter::RcovFormatter.path_result )
      File.delete( SimpleCov::Formatter::RcovFormatter.path_result )
    end

    # keys are fake source files, values are number of lines to generate for that file
    # MAKE SURE these are all evenly divisible by 3
    fixtures = { 'sample.rb' => 141, 'app/models/user.rb' => 165,
      'app/controllers/sample_controller.rb' => 33 }
    @original_result = {}
    fakeroot = '/fake'
    fixtures.each_pair do |fixture_file, num_lines|
      @original_result[File.join(fakeroot, fixture_file)] =
        generate_coverage_results(num_lines)
      fixture_source_lines = generate_source_lines(fixture_file, num_lines)
      File.stubs(:readlines).with(File.join(fakeroot, fixture_file)).returns(fixture_source_lines)
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
    results = []
    case num_lines
    when 1..100
      (num_lines*0.10).round.times do
        results << result_types[0]
      end
      (num_lines*0.20).round.times do
        results << result_types[1]
      end
      (num_lines*0.70).round.times do
        results << result_types[2]
      end
    when 100..150
      (num_lines*0.20).round.times do
        results << result_types[0]
      end
      (num_lines*0.40).round.times do
        results << result_types[1]
      end
      (num_lines*0.40).round.times do
        results << result_types[2]
      end
    else
      (num_lines*0.05).round.times do
        results << result_types[0]
      end
      (num_lines*0.15).round.times do
        results << result_types[1]
      end
      (num_lines*0.80).round.times do
        results << result_types[2]
      end
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
