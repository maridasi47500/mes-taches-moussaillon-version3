require 'open-uri'
require 'nokogiri'
class QueensgambitController < ApplicationController
  def index
    @posts = (params[:postscats] || "Beth%20Harmon").gsub('/','*s*')
    @page = params[:page].to_i > 0 ? params[:page] : "1"
    @myparams="&postscats=#{@posts}"
    url="https://archiveofourown.org/tags/#{@posts}/works?page=#{@page}".gsub(' ',"%20")
    p url
    @doc=Nokogiri::HTML(URI.open(url))
    @lastpage=@doc.css('.pagination')[0].children
    p @lastpage
    #@lastpage
    @lastpage=@lastpage[@lastpage.length-3].text.squish.to_i
    @arts={}
    @doc.css('.header.module').each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.children[1].children[1].text)
      
    end
    @doc.css("[rel='author']").each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.text)
      
    end
    @doc.css('.datetime').each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.text)
    end
    @doc.css('.tags').each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.children.map {|x|x.text.squish})
    end
    @doc.css('.summary').each_with_index do |t,i|
      @arts[i] ||= []
      @arts[i].push(t.text.squish)
    end
    

  end
  def new
    params.permit(:s)
  end
end
