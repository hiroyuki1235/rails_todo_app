(1..5).each do |i|
  Task.create(
    name: "Task #{i}",
    status: 0
  )
end
