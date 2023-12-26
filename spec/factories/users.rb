FactoryBot.define do
  factory :user do
    
    nickname   {Faker::Name.initials(number: 2)}
    email      {Faker::Internet.email}
    password   {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name  { generate_japanese_last_name }
    first_name { generate_japanese_first_name }
    last_name_kana {  generate_japanese_last_name_kana }
    first_name_kana {  generate_japanese_first_name_kana}
    birthday { Faker::Date.birthday(min_age: 1, max_age: 100) }
  end
end

def generate_japanese_last_name
  last_name = %w[山田 加藤 田中]
  last_name.sample
end

def generate_japanese_first_name
  first_names = %w[太郎 一郎 花子 久美子] 
  first_names.sample
end

def generate_japanese_last_name_kana
  last_names_kana = %w[ヤマダ カトウ タナカ] 
  last_names_kana.sample
end

def generate_japanese_first_name_kana
  first_names_kana = %w[タロウ イチロウ ハナコ クミコ] 
  first_names_kana.sample
end

