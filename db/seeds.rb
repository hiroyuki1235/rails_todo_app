(1..10).each do |i|
  Task.create(
    name: "Task #{i}",
    status: 0
  )
end
