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

if running_total > 0
  totals.append(running_total)
end

tot = totals.sort()
puts "Question 1: max calories", tot[-1]
puts "Question 2: top three max calories", (tot[-1] + tot[-2] + tot[-3])
