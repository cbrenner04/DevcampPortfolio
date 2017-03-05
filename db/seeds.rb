# frozen_string_literal: true
10.times do |index|
  Blog.create!(
    title: "My Blog Post #{index}",
    body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum ' \
          'facere accusamus, at voluptate explicabo, doloremque voluptas nam ' \
          'minima natus excepturi assumenda suscipit eum quisquam sint eius ' \
          'ratione deleniti autem maxime.'
  )
end

p '10 blog posts created'

5.times do |index|
  Skill.create!(
    title: "Rails #{index}",
    percent_utilized: 10 * index
  )
end

p '5 skills created'

9.times do |index|
  Portfolio.create!(
    title: "Portfolio #{index}",
    subtitle: 'My great service',
    body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam ' \
          'atque dolor, obcaecati neque eligendi commodi eaque, accusamus ' \
          'voluptatibus illum autem nesciunt libero id dolore ipsa facere ' \
          'dignissimos asperiores, et mollitia!',
    main_image: 'https://placeholdit.imgix.net/~text?txtsize=33&txt=600' \
                '%C3%97400&w=600&h=400',
    thumb_image: 'https://placeholdit.imgix.net/~text?txtsize=33&txt=350' \
                 '%C3%97200&w=350&h=200'
  )
end

p '9 portfolio items created'
