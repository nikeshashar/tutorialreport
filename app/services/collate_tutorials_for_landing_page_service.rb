class CollateTutorialsForLandingPageService

 def call
   create_hash
 end

 private

 def tutorials
   Tutorial.all
 end

 def top_tutorials
   tutorials.shuffle.map { |tutorial| tutorial if tutorial.rating >= 7 }.compact
 end

 def create_hash
   { first: top_tutorials[0],
     second: top_tutorials[1],
     third: top_tutorials[2],
     fourth: top_tutorials[3] }.compact
 end
end
