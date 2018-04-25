class CollateTutorialsForLandingPageService

 def call
   create_hash
 end

 private

 def tutorials
   Tutorial.all
 end

 def random_top_tutorials
   tutorials.shuffle.map { |tutorial| tutorial if tutorial.rating >= 7 }.compact
 end

 def create_hash
   { first: random_top_tutorials[0],
     second: random_top_tutorials[1],
     third: random_top_tutorials[2],
     fourth: random_top_tutorials[3] }.compact
 end
end
