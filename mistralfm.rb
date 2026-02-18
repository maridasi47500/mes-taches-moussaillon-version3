require 'nokogiri'
require 'open-uri'
@doc=Nokogiri::XML(URI.open("https://www.mistralfm.com/rss-feed-27"))
@doc.children[0].children[1].children[10..].map {|x|x.text}.select{|x|x.include?('mistralfm.com')}.map{|x|x.strip.squish.split('https')[0].strip.split(' - ')}.map{|a,b|{title: b, artist: Artist.find_or_create_by(name: a)}}
