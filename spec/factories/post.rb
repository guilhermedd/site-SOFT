# spec/factories/post.rb
FactoryBot.define do
  factory :post do
    public { 1 }
    title {"Um ótimo dia"}
    summary {"Hoje foi um dos melhores dias que eu ja viviv"}
    content {"Eu conheci minha namorada, Gabriela dos Santos Costa"}
    feeling {"Especial"}
    association :user, factory: :user

  end
end
