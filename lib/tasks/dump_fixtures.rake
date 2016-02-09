require 'fixtures_dumper/dumper'

namespace :db do
  namespace :fixtures do

    desc "Dump data from database to fixtures easily. Options: SKIP_TABLES: comma separated list of tables which will skipped during dumping. TABLE: table_name. Only this table will be dumped."
    task :dump => :environment do
      if ENV['TABLES']
        ENV['TABLES'].each do |table|
          FixturesDumper::Dumper.new(skip_tables: ENV['SKIP_TABLES'], table_to_dump: table ).dump
        end
      else
        FixturesDumper::Dumper.new(skip_tables: ENV['SKIP_TABLES'], table_to_dump: ENV['TABLE']).dump
      end
    end
  end
end
