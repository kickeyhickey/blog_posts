
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


blogs = [
    {title: "yoyo", content:"hey hey"},
    {title: "blueGreen", content:"colors"},
    {title: "superman", content:"is better than Batman"}

]

blogs.each do |each_blog|
    Post.create each_blog
    puts "creating blog #{each_blog}"
end