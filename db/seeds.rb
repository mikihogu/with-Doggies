# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'dog@dog',
  password: 'thedoggies'
)

# 会員登録
[
 ['保倉こむぎ', 'こむぎ', 'comugi', 'comugi@dog', 'パピヨン', 'Hello'],
 ['保倉こころ', 'こころ', 'cocoro', 'cocoro@dog', 'パピヨン', 'Hello'],
 ['保倉ちょこ', 'ちょこ', 'chocochoco', 'choco@dog', 'パピヨン', 'Hello'],
 ['篠原アル', 'アル', 'aruaru', 'aru@dog', 'キャバリアキングチャールズスパニエル', 'Hello'],
 ['山本コタロー', 'コタロー', 'kotaro', 'kotaro@dog', 'ゴールデンレトリバー', 'Hello'],
 ['中村マル', 'マル', 'marumaru', 'maru@dog', 'ヨークシャーテリア', 'Hello'],
 ['高橋はる', 'ハル', 'haruharu', 'haru@dog', 'チワワ', 'Hello'],
 ['野口ジョン', 'ジョン', 'jonjon', 'jon@dog', 'ビーグル', 'Hello'],
 ['北村サク', 'サク', 'sakusaku', 'saku@dog', 'フレンチブルドッグ', 'Hello'],
].each do |name, nickname, password, email, dog, introduction|
  Member.create!({ name: name,
                  nickname: nickname,
                  password: password,
                  email: email,
                  dog: dog,
                  introduction: introduction })
 end


categories = %w(ドッグラン 公園 カフェ 病院 ホテル 他)

categories.each do |category|
  Category.create!(name: category)
end

tags = %w(ドッグラン 公園 カフェ 病院 ホテル 預かり所 大型犬OK 中型犬 小型犬 ワクチン接種証明 マナーパンツ必須 店内OK)

tags.each do |tag|
  Tag.create!(name: tag)
end
