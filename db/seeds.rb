100.times do |num|
  User.create!(
    name: "ユーザー#{num}",
    email: "example#{num}@example.com"
  )
end

25.times do |num|
  Micropost.create!(
    content: "content_#{num + 1}",
    user_id: num + 1
  )
end
