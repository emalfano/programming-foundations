def car(new_car)
  make = make(new_car)
  model = model(new_car)
  [make, model]
end

def make(new_car)
  new_car.split('').first
end

def model(new_car)
  new_car.split(' ').last
end

make, model = car('Ford Mustang')
puts make
puts model
make == "Ford" # => false
