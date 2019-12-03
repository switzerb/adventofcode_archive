#!/usr/bin/env bash
set -e

day=$1
year=$2

if [ "$year" = "" ]; then
   year=`date +%Y`
fi

if [ "$day" = "" ]; then
    echo "Usage: $0 <day>"
    exit
fi

cd `dirname $0`
cd ../${year}

if [ ${#day} -eq 1 ]; then
    day="0$day"
fi

root="day_$day"
mkdir ${root}

cat << EOF > ${root}/input.txt
EOF

cat << EOF > ${root}/${root}.rb
#!/usr/bin/env ruby
 class Solver
  def hello
    "hello, world!"
  end
 end
EOF

cat << EOF > ${root}/${root}_test.rb
#!/usr/bin/env ruby
  begin
    gem 'minitest', '>=5.0.0'
    require 'minitest/autorun'
    require_relative '${root}.rb'
  rescue Gem::LoadError => e
    puts "\nError:\n#{e.backtrace.first} #{e.message}"
    puts DATA.read
    exit 1
  end

 class SolverTest < Minitest::Test
   def setup
     @day = Solver.new
   end

   def test_hello
     assert_equal "hello, world!", @day.hello
   end
 end
EOF


echo "Day ${day} created!"

