def sluggish_octopus(fish) # O(n^2)
  longest_fish = fish.first
  fish.each do |fish1|
    fish.each do |fish2|
      longest_fish = fish1 if fish1.length > fish2.length
    end
  end
  longest_fish
end

def dominant_octopus(fish) # O(nlogn)
  return [] if fish.empty?

  # use random pivot to avoid degenerate case of pre-sorted array
  # which would run in O(n^2) time
  pivot_index = rand(0...fish.length)
  pivot = fish[pivot_index]
  remainder = fish[0...pivot_index] + fish[pivot_index+1..-1]

  left = remainder.select { |fish| fish.length > pivot.length }
  right = remainder.select { |fish| fish.length <= pivot.length }
  sorted_fish = dominant_octopus(left) + [pivot] + dominant_octopus(right)
end

def clever_octopus(fish) # O(n)
  longest_fish = fish.first
  fish.each do |f|
    longest_fish = f if f.length > longest_fish.length
  end
  longest_fish
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == direction
  end
  nil
end

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end

fish_array = [
  'fish',
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh'
]

p sluggish_octopus(fish_array)
p dominant_octopus(fish_array).first
p clever_octopus(fish_array)

tiles_array = [
  "up",
  "right-up",
  "right",
  "right-down",
  "down",
  "left-down",
  "left",
  "left-up"
]

p slow_dance("right-down", tiles_array)

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

p fast_dance("right-down", tiles_hash)
