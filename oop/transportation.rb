module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end

end

tonka = Transportation::Truck.new
puts tonka