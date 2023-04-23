FactoryBot.define do
  factory :job do
    job_title { Faker::Name.name }
    workshop_name { Faker::Name.name }
    origin_to_prefecture_id { Faker::Number.between(from: 2, to: 48) }
    description { Faker::Lorem.sentence }

    association :user

    after(:build) do |job|
      job.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
