5.times do
  Period.create({
    starts_at: Time.now,
    ends_at: Time.now + 7.days
  })
end

5.times do |i|
  Project.create({
    name: "Projeto #{i + 1}",
  })
end

10.times do |i|
  Criteria.create({
    description: "Critério #{i + 1}",
    ordering: i
  })
end

Period.all.each do |period|
  Project.all.each do |project|
    Criteria.all.each do |criteria|
      Report.create({
        period: period,
        criteria: criteria,
        project: project,
        situation: Report::ALLOWED_SITUATIONS.sample
      })
    end
  end
end
