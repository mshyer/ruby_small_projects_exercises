#From Launch School OOP book section Classes and Objects 1
module MountWeaponsSystems

  def weapons
    ["RPG", "Gun turret", "Cannon"]
  end

  def mount(weapon, vehicle)
    puts "Weapon: #{weapon} mounted on #{vehicle}"
  end

end

class Vehicle
  attr_accessor :color, :speed, :engine, :number_of_vehicles
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @model = model
    @color = color
    @@number_of_vehicles += 1
    self.engine = "on"
    self.speed = 0
    puts "New #{self.class} object initialized. Number of vehicles: #{Vehicle.total_number_of_vehicles}"
    @age = vehicle_age(@year)
  end

  def self.total_number_of_vehicles
    @@number_of_vehicles
  end

  def honk
    puts "WAHHH"
    puts @age
  end

  def self.gas_mileage(gallons, miles)
    miles / gallons.to_f
  end

  def set_info(y, c, m)
    self.year = y
    self.color = c
    self.model = m
  end

  def accelerate
    self.speed += 10
    puts "New speed: #{speed}"
  end

  def brake
    self.speed -= 10
    puts "New speed: #{speed}"
  end

  def engine_off
    if self.speed == 0
      self.engine = "off"
      puts "the engine is now #{engine}"
    else
      puts "Cannot shut car off while moving"
    end
  end

  def spray_paint(c)
    self.color = c
    puts "Your new #{color} paint job looks great!"
  end

  private

  def vehicle_age(year)
    a = Time.new(year)
    b = Time.now()
    puts "ahh"
    puts ((b - a) / 60 / 60 / 24 / 365).to_i
    puts b.year - a.year

  end

end

class Pickup < Vehicle
  include MountWeaponsSystems
  OPEN_BACK = true

end

class MyCar < Vehicle

  OPEN_BACK = false

  def OPEN_BACK
    OPEN_BACK
  end

  def to_s
    puts "I'm a cool car named #{model}"
  end

end

hyundai = MyCar.new("2009", "Green", "Hyundai Elantra")
#hyundai.set_info("2009", "Green", "Hyundai Elantra")

# puts hyundai.year
# puts hyundai.color
# puts hyundai.model
# puts hyundai.speed
# hyundai.accelerate
# hyundai.accelerate
# hyundai.accelerate
# hyundai.accelerate
# hyundai.brake
# hyundai.brake
# hyundai.engine_off
# hyundai.brake
# hyundai.brake
# hyundai.engine_off

# hyundai.spray_paint("blue")

# puts MyCar.gas_mileage(100, 5000)
# hyundai.to_s

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name

hyundai.honk

puts hyundai.OPEN_BACK

im_a_truck = Pickup.new("3000", "holographic", "Nissan Futura")

im_a_truck.mount(im_a_truck.weapons.sample, im_a_truck.model)

hyundai.honk

# puts Pickup.ancestors
# puts MyCar.ancestors
# puts MountWeaponsSystems.ancestors