FactoryBot.define do
  factory :contact_inquiry do
    name { "Jamie Beispiel" }
    email { "jamie@example.com" }
    message { "Ich hätte Interesse an einer Zusammenarbeit." }

    initialize_with { new(attributes) }
  end
end
