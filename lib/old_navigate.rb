 def _navigate(curr_location)
    user_input.loop do |key|
      key = key.to_s
      new_location = case key
        when 'a', 'left'
          [curr_location[0] +  LEFT[0], curr_location[1] + LEFT[1]]
        when 's', 'down'
          [curr_location[0] +  DOWN[0], curr_location[1] + DOWN[1]]
        when 'd', 'right'
          [curr_location[0] + RIGHT[0], curr_location[1] + RIGHT[1]]
        when 'w', 'up'
          [curr_location[0] +    UP[0], curr_location[1] +    UP[1]]
        when 'control_m', 'space'
          return new_location
        else
          puts "use [a] [s] [d] [w] or the arrow keys."
          next
        end
      return new_location
    end
  end

