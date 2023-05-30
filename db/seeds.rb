(1..100).each do |i|
  Task.create(
    name: "Task #{i}",
    content: "Task Content #{i}",
    status: 0
  )
end
