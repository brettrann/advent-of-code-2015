#!/usr/bin/env ruby

require 'pp'

lights = File.readlines('input.txt').map(&:strip).map {|l|l.split('')}

# border top and left to avoid checking boundaries
lights.unshift(lights.length.times.collect { '.' })
lights << lights.length.times.collect { '.' }
lights.map! {|line| line.unshift('.'); line << '.'}

# lights change at the same time so store two screens
lights2 = 102.times.collect { 102.times.collect { '.' }}
screens = [lights, lights2]

# on light: turns off unless 2-3 neighbors are on
# off light: turns on if 3 neighbors are on
def count_surrounding_on(pane, x, y)
  count = 0
  (-1..+1).each do |xx|
    (-1..+1).each do |yy|
      next if xx == 0 && yy == 0
      count += 1 if pane[x+xx][y+yy] == '#'
    end
  end
  count
end

def evaluate(pane, x, y)
  surrounding = count_surrounding_on(pane, x, y)
  if pane[x][y] == '#'
    return surrounding.between?(2,3) ? '#' : '.'
  else
    return surrounding == 3 ? '#' : '.'
  end
end

def ensure_on(pane)
  lastx = pane.size-2
  lasty = pane[lastx].size-2
  pane[1][1] = '#'
  pane[lastx][1] = '#'
  pane[1][lasty] = '#'
  pane[lastx][lasty] = '#'
end

def step(panes)
  ensure_on(panes[0])
  (1...panes[0].size-1).each do |x|
    (1...panes[0][x].size-1).each do |y|
      panes[1][x][y] = evaluate(panes[0], x, y)
    end
  end
  panes.rotate!
  ensure_on(panes[0])
  return panes
end

100.times do
   screens = step(screens)
end

puts screens[0].flatten.count('#')
