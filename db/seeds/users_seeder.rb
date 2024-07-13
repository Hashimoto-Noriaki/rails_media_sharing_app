4.times do |val|
  User.create!(
    name: "test#{val + 1}",
    email: "test#{val + 1}@example.com",
    password: "password#{val + 1}",
    password_confirmation: "password#{val + 1}",
    created_at: Time.zone.now
  )
end
