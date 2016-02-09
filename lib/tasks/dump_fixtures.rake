require 'fixtures_dumper/dumper'

namespace :db do
  namespace :fixtures do

    desc "Dump data from database to fixtures easily. Options: SKIP_TABLES: comma separated list of tables which will skipped during dumping. TABLE: table_name. Only this table will be dumped."
    task :dump => :environment do
      out_path = ENV['FIXTURES_PATH']
      if ENV['TABLES']
        ENV['TABLES'].split(',').each do |table|
          puts "dumping table #{table}"
          FixturesDumper::Dumper.new(skip_tables: ENV['SKIP_TABLES'], table_to_dump: table, out_path: out_path ).dump
        end
      else
        FixturesDumper::Dumper.new(skip_tables: ENV['SKIP_TABLES'], table_to_dump: ENV['TABLE'] ,out_path: out_path ).dump
      end
    end
  end
end
