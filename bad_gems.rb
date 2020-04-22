#!/usr/bin/env ruby

puts "Prints if any of your gems is in offending list: #{__FILE__.gsub('.rb', '.txt')}"
abort("Usage: #{__FILE__} <Gemfile.lock>") if ARGV[0].nil?

unique = [].tap do |u|
  # File.open('sample_gemfile_lock', 'r').each do |f|
  File.open(ARGV[0], 'r').each do |f|
    match = f.match /\s[a-z_0-9-]{3,}\s/
    u << match[0].strip if match
  end
end.uniq

bad_list = [].tap do |r|
  File.open('bad_gems.txt', 'r').each { |f| r << f.chomp }
end

count = 0
unique.each do |u|
  if bad_list.include? u
    puts u
    count += 1
  end
end

puts 'No suspicious gems' if count.zero?
