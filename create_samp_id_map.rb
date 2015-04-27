#!/usr/bin/env ruby

fh = File.open("transposed_table", 'r')

otu_hash = {}
otus = []

fh.each do |line|
  arr = line.split
  if $. == 1
    otus = arr
    arr.each do |otu|
      otu_hash[otu] = {}
    end
  else
    count = 0
    arr.each do |val|
      if count ==0
        count += 1
        next
      end
      #puts otus[ count - 1 ]
      otu_hash[otus[count]].merge!( arr[0] => val)
      count +=1
    end
  end
end

otu_hash.each do |key, value|
  value.keys.each do |entry|
    puts "#{key}\t#{entry}\t#{value[entry]}"
  end
end
