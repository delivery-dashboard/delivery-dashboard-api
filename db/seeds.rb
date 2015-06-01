5.times do
  Period.create
end

5.times do |i|
  Project.create({
    name: "Projeto #{i + 1}",
    starts_at: Time.now,
    ends_at: Time.now + 7.days
  })
end

10.times do |i|
  Criteria.create({
    name: "Critério #{i + 1}",
    ordering: i
  })
end

Period.all.each do |period|
  Project.all.each do |project|
    Criteria.all.each do |criteria|
      Status.create({
        period: period,
        criteria: criteria,
        project: project,
        status: Status::ALLOWED_STATUSES.sample
      })
    end
  end
end