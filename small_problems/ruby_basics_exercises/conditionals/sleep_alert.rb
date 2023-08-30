status = ['awake', 'tired'].sample

alert = if status == "awake"
          "be productive"
        else
          "go to slizzle"
        end

puts alert

