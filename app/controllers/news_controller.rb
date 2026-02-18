require 'open-uri'
require 'nokogiri'
class NewsController < ApplicationController
  layout false
  def index
    url="https://45secondes.fr/?#{myparams.to_query}"
    p url
    @doc=Nokogiri::HTML(URI.open(url))
    @arts={}
    @doc.css('.entry-title').each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.text.squish)
    end
    @doc.css('.wp-post-image').each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.attributes['src'].value)
    end
    @doc.css('[rel="author"]').each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.attributes['title'].value)
    end
    @doc.css('.entry-date').each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.attributes['datetime'].value)
    end

    @doc.css('.g1-frame').each_with_index do |t,i|
      @arts[i] ||= []
      @doc2 = Nokogiri::HTML(URI.open(t.attributes['href'].value))
      @arts[i].push(@doc2.css('p').text.squish)
    end
    

  end
  private
  def myparams
    params.permit(:s)
  end
end
