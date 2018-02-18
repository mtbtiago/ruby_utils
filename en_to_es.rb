#!/usr/bin/env ruby
require 'yaml'
cfg = YAML.load_file(__FILE__.gsub('.rb', '.yml'))
translations = cfg['translations']
STDIN.read.split('\n').each do |line|
  translated = line
  translations.each do |translation|
    translation[1].each { |k, v| translated.gsub!(Regexp.new(k, Regexp::IGNORECASE), v) }
  end
  puts translated
end
