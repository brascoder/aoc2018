defmodule Part1 do
  def run(input_path) do
    input_path
    |> File.stream!
    |> Stream.map(fn(x) -> Integer.parse(x) |> elem(0) end)
    |> Enum.sum
  end
end

defmodule Part2 do
  def run(input_path) do
    input_path
    |> File.stream!
    |> Stream.map(fn(x) -> Integer.parse(x) |> elem(0) end)
    |> Stream.cycle
    |> Enum.reduce_while({0, MapSet.new([])}, fn(x, {frq, acc}) ->
      new_frq = frq + x
      if new_frq in acc do
        {:halt, new_frq}
      else
        {:cont, {new_frq, MapSet.put(acc, new_frq)}}
      end
    end)
  end
end

IO.puts "Part 1: #{Part1.run("./01/input")}"
IO.puts "Part 2: #{Part2.run("./01/input")}"
