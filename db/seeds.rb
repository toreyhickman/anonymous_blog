require 'faker'

def make_fake_post_data
  {:title => Faker::Lorem.words(4, false).map { |x| x.capitalize }.join(" "),
   :body => Faker::Lorem.paragraph(rand(4..7)),
   :tag_names => "#{Faker::Lorem.word}, #{Faker::Lorem.word}, dbc"
  }
end

10.times { Post.create(make_fake_post_data) }
