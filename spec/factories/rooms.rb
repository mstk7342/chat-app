# 値でFactorBotの指定
FactoryBot.define do
  factory :room do
    name {Faker::Team.name}
  end
end