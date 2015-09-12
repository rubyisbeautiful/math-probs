require 'byebug'

class MathStuff

  def self.format_math_problems(problems = self.generate_math_problems, row_max=10)
    row = []
    rows = []
    begin
      row = problems.shift(row_max)
      rows << row
    end until problems.empty?
    rows
  end

  def self.generate_math_problems(num=100, type='both', min=0, max=12, sort=true)
    num = num.nil? ? 100 : num
    type = type.nil? ? 'both' : (type.length.zero? ? 'both' : type)
    min = min.nil? ? 0 : min
    max = max.nil? ? 12 : max
    sort = sort.nil? ? true : sort

    problems = []
    num.times do
      if type == 'both'
        t = rand(1..2) % 2 == 0 ? '+' : '-'
      else
        t = type == 'addition' ? '+' : '-'
      end
      problems << self.generate_math_problem(t, min, max, sort)
    end
    problems
  end

  def self.generate_math_problem(type, min=0, max=12, sort=true)
    ary = [rand(min..max), rand(min..max)]

    if sort && type == '-'
      ary.sort!{ |a,b| b <=> a }
    end

    [ *ary, type ]
  end

end

