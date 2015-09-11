class MathStuff


  # generate math problems

  def self.format_math_problems(problems = self.generate_math_problems, row_max=10)
    index=0
    row = []
    rows = []
    while problems.slice(index,row_max).size >= row_max
      row = problems.slice(index,row_max)
      rows << row
      index += row_max
    end
    rows
  end

  def self.generate_math_problems(num=100)
    problems = []
    num.times do
      t = rand(1..2) % 2 == 0 ? '+' : '-'
      problems << self.generate_math_problem(t)
    end
    problems
  end

  def self.generate_math_problem(type, max=12, min=0, sort=true)
    ary = [rand(min..max), rand(min..max)]

    if sort && type == '-'
      ary.sort!{ |a,b| b <=> a }
    end

    [ *ary, type ]
  end

end

