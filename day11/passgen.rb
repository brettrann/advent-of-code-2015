#!/usr/bin/env ruby

pass = 'cqjxjnds'
pass = 'cqjxxyzz'

while true
  pass.succ!
  next if pass =~ /[iol]/
  next if pass !~ /(.)\1.*([^\1])\2/
  success = false
  ('a'..'z').each_cons(3).map(&:join).each do |three|
    if pass =~ /#{three}/
      success = true
      break
    end
  end
  if success
    print pass
    break
  end
end
