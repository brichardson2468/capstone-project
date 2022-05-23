Doctor.destroy_all
Patient.destroy_all


puts "🌱 SEEDING DOCTORS... 🌱 "

Doctor.create(
    name: "Dr. Tobias Fünke", 
    username: "doctor1", 
    thumbnail: "https://static.wikia.nocookie.net/arresteddevelopment/images/0/0a/Season_1_Character_Promos_-_Tobias_F%C3%BCnke_02.jpeg/revision/latest/scale-to-width-down/300?cb=20120429230332", 
    password_digest: "pass"
)
Doctor.create(
    name: "Dr. Elliot Reid", 
    username: "doctor2", 
    thumbnail: "https://media1.popsugar-assets.com/files/thumbor/IUpHZqK9MGC2IlCEiFrzP6jVeU8/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2017/08/24/842/n/1922283/bb8d101484f04831_GettyImages-138435375_master/i/Sarah-Chalke-Dr-Elliot-Reid.jpg", 
    password_digest: "pass"
)

puts "🌱 SEEDING PATIENTS... 🌱 "

10.times do
Patient.create(
    name: Faker::Name.name,
    username: Faker::Color.unique.color_name,
    DOB: Faker::Date.between(from: '1900-01-01', to: '1940-01-01'),
    doctor_id: 1,
    password_digest: "pass"
)
end

10.times do
Patient.create(
    name: Faker::Name.name,
    username: Faker::Color.unique.color_name,
    DOB: Faker::Date.between(from: '1900-01-01', to: '1940-01-01'),
    doctor_id: 2,
    password_digest: "pass"
)
end

puts "✅ DONE SEEDING! ✅ "