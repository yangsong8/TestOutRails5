10.times do |blog|
  Blog.create!(
      title: "my blog post #{blog}",
      body: "Thoreau's books, articles, essays, journals, and poetry amount to more than 20 volumes. Among his lasting contributions are his writings on natural history and philosophy, in which he anticipated the methods and findings of ecology and environmental history, two sources of modern-day environmentalism. His literary style interweaves close observation of nature, personal experience, pointed rhetoric, symbolic meanings, and historical lore, while displaying a poetic sensibility, philosophical austerity, and Yankee attention to practical detail."
  )
end

puts "10 blog posts created"

5.times do |skill|
    Skill.create!(
        title:"Rails #{skill}",
        percent_utilized:20
    )
end

puts "5 skills created"

9.times do |portfilio_item|
    Portfolio.create!(
        title: "Portfolio title: #{portfilio_item}",
        subtitle: "My great service",
        body: "Thoreau is best known for his book Walden, a reflection upon simple living in natural surroundings, and his essay Civil Disobedience"  ,
        main_image:"http://via.placeholder.com/600x400",
        thumb_image:"http://via.placeholder.com/350x200"
    )
end

puts "9 portfolio items created"