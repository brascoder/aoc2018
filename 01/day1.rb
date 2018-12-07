class Part1
  def self.run(input_path)
    File.read(input_path).split.map(&:to_i).sum
  end
end

class Part2
  def self.run(input_path)
    io = File.read(input_path).split.map(&:to_i).each
    frq = 0
    acc = []

    loop do
      frq += io.next
      return frq if acc.include? frq
      acc << frq
    rescue StopIteration
      io.rewind
    end
  end
end

puts Part1.run('./01/input')
puts Part2.run('./01/input')
