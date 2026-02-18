require 'nokogiri'
require 'open-uri'
class Mytweet


  def initialize(url)
  end
  def reponses
    #array reponse
  end
end
class Tweet < ApplicationRecord
validates_uniqueness_of :username, scope: [:created_at, :place,:content]
def self.withtweets(tweetstwitter)
    begin
    @tweettwitter =tweetstwitter[myparams['id'].to_i]
    rescue => e
      p e.message
      @tweettwitter=nil
    end
    if @tweettwitter && @tweettwitter != nil
      
    p @tweettwitter
    username= @tweettwitter ? @tweettwitter.user.name : ""
    Tweet.new(content: @tweettwitter.full_text, username: username, place: @tweettwitter.place.full_name+' '+@tweettwitter.user.location,created_at: @tweettwitter.created_at)
    else
     nil
    end
end
  def self.findtweets2(account,key,id)
    if account
            @account = Twitteraccount.find_by(person_id: account)
            @accounts = Twitteraccount.where(person_id: account).pluck(:name, :username)
            @nb=10
            @mytweetstwitter = (key && key.length > 0 ? $client.search(key,count: @nb).take(@nb) : []).map {|x| x}
            @mytweetstwitter += (id.to_i > 0 ? [$client.status(id.to_i)] : []).map {|x| x}
            @mycurrenttweet = Tweet.newtweet(id) 
    else
    @accounts = []
    #Twitteraccount.all.sample(5).pluck(:name, :username)
    #['mrs baozi','mrs__baozi']
    @nb=10
    end
    @mytweetstwitter ||= []
    @tweetstwitter = @accounts.map {|x| $client.user_timeline(x[1],count:@nb)}.flatten#+$client.search("baozi").take(100)
    @tweetstwitter += @mytweetstwitter
    @tweetstwitter

end
  def self.findtweets1(account,key,id,lang)
    if account
      
            @account = Twitteraccount.find_by(id: account)
            @accounts = Twitteraccount.where(id: account).pluck(:name, :username)
            @nb=1000
            @mytweetstwitter = (key && key.length > 0 ? $client.search(key,count: @nb,lang: lang).take(@nb) : []).map {|x| x}
            @mytweetstwitter += (id.to_i > 0 ? [$client.status(id.to_i)] : []).map {|x| x}
            @mycurrenttweet = Mytweet.new("https://twitter.com/i/api/2/timeline/conversation/#{id}.json?include_profile_interstitial_type=1&include_blocking=1&include_blocked_by=1&include_followed_by=1&include_want_retweets=1&include_mute_edge=1&include_can_dm=1&include_can_media_tag=1&skip_status=1&cards_platform=Web-12&include_cards=1&include_ext_alt_text=true&include_quote_count=true&include_reply_count=1&tweet_mode=extended&include_entities=true&include_user_entities=true&include_ext_media_color=true&include_ext_media_availability=true&send_error_codes=true&simple_quoted_tweet=true&referrer=tweet&count=20&cursor=LBl2gsC1meDcy/0hgsC9ocnyvf0hgMC0+Ybptv0hgoC/hYij2v0hgsC0sbzH2f0hgoC/2bOgtv0hgMCmsaL/1v0hJQISAAA=&include_ext_has_birdwatch_notes=false&ext=mediaStats,highlightedLabel")
    else
    @accounts = []
    #Twitteraccount.all.sample(5).pluck(:name, :username)
    #['mrs baozi','mrs__baozi']
    @nb=20
    end
    @mytweetstwitter ||= []
    @tweetstwitter = @accounts.map {|x| $client.user_timeline(x[1],count:@nb,lang: lang)}.flatten#+$client.search("baozi").take(100)
    @tweetstwitter += @mytweetstwitter
@tweetstwitter
end
  def self.newtweet(id)
Mytweet.new("https://twitter.com/i/api/2/timeline/conversation/#{id}.json?include_profile_interstitial_type=1&include_blocking=1&include_blocked_by=1&include_followed_by=1&include_want_retweets=1&include_mute_edge=1&include_can_dm=1&include_can_media_tag=1&skip_status=1&cards_platform=Web-12&include_cards=1&include_ext_alt_text=true&include_quote_count=true&include_reply_count=1&tweet_mode=extended&include_entities=true&include_user_entities=true&include_ext_media_color=true&include_ext_media_availability=true&send_error_codes=true&simple_quoted_tweet=true&referrer=tweet&count=20&cursor=LBl2gsC1meDcy/0hgsC9ocnyvf0hgMC0+Ybptv0hgoC/hYij2v0hgsC0sbzH2f0hgoC/2bOgtv0hgMCmsaL/1v0hJQISAAA=&include_ext_has_birdwatch_notes=false&ext=mediaStats,highlightedLabel")

end
  before_save :savetodb

def savetodb
  self.savedtodb = DateTime.now
end
end
