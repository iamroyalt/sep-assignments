include 'node'

class kevinBacon

  def find_kevin_bacon(actor)
    #set up empty array
    films = []
    #loop through list of films looking for match to KB and push title to films array if match
    actor.film_actor_hash.each do |title, actors|
      actors.each do |actor|
        if actor == "Kevin_Bacon"
           films.push(title)
        else
          find_kevin_bacon(actor)
        end
      end
    end
    #if number of films less than or equal to 6 put "Degrees...." else put "More than ....."
    (films.length <= 6 && films.length > 0) ? puts "Degrees of Kevin Bacon: #{films.all}" : puts "More than six degrees from Kevin Bacon"
  end
end
