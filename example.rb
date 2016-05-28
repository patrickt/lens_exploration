#!/usr/bin/ruby -wU

class Vehicle
  attr_accessor :horsepower
  attr_accessor :manufacturer
  attr_accessor :model
  attr_accessor :coords

  def initialize(ma, mo, hp, cs)
    @manufacturer = ma
    @model = mo
    @horsepower = hp
    @coords = cs
  end

  def to_s
    "#{manufacturer} #{model}, #{horsepower} hp"
  end
end


pinto = Vehicle.new("Pinto", "Pinto", 90, [])
pinto.horsepower -= 1
pinto.model += " (Dangerous)"

enzo = pinto.clone.tap do |car|
  car.manufacturer = "Ferrari"
  car.model = "Enzo"
  car.horsepower = 651
end

puts pinto.to_s
puts enzo.to_s
