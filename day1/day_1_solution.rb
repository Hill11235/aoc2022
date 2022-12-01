file='calories.txt'
running_total = 0
totals = []

File.readlines(file).each do |line|
  if line == "\n"
    totals.append(running_total)
    running_total = 0
  else
    running_total += line.to_i
  end
end

tot = totals.sort()
puts (tot[-1] + tot[-2] + tot[-3])
