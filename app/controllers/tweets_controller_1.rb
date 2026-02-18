require 'nokogiri'
require 'open-uri'
class Mytweet
  def initialize(url)
  end
  def reponses
    #array reponse
  end
end

class TweetsController < ApplicationController
  before_action :listtweet, only: [:index,:show]
  before_action :listtweet2, only: [:myfeeds]
  def index
  end
  def show
    
    @tweet=@tweets[params[:id].to_i]

    @newtweet = Tweet.new(post_types: PostType.where(name:'Tweet'), content: @tweet.full_text+'-'+@tweet.user.name+' '+@tweet.place.full_name+' '+@tweet.user.location,created_at: @tweet.created_at)
    respond_to do |format|
        format.html
        format.js
    end

  end
  def myfeeds
    
  end
  private
  def listtweet
    account =params[:taccount]
    key =params[:keyword]
    id =params[:myid]
    if account
      
            @account = Twitteraccount.find_by(id: account)
            @accounts = Twitteraccount.where(id: account).pluck(:name, :username)
            @nb=1000
            @mytweets = (key && key.length > 0 ? $client.search(key,count: @nb).take(@nb) : []).map {|x| x}
            @mytweets += (id.to_i > 0 ? [$client.status(id.to_i)] : []).map {|x| x}
            @mycurrenttweet = Mytweet.new("https://twitter.com/i/api/2/timeline/conversation/#{id}.json?include_profile_interstitial_type=1&include_blocking=1&include_blocked_by=1&include_followed_by=1&include_want_retweets=1&include_mute_edge=1&include_can_dm=1&include_can_media_tag=1&skip_status=1&cards_platform=Web-12&include_cards=1&include_ext_alt_text=true&include_quote_count=true&include_reply_count=1&tweet_mode=extended&include_entities=true&include_user_entities=true&include_ext_media_color=true&include_ext_media_availability=true&send_error_codes=true&simple_quoted_tweet=true&referrer=tweet&count=20&cursor=LBl2gsC1meDcy/0hgsC9ocnyvf0hgMC0+Ybptv0hgoC/hYij2v0hgsC0sbzH2f0hgoC/2bOgtv0hgMCmsaL/1v0hJQISAAA=&include_ext_has_birdwatch_notes=false&ext=mediaStats,highlightedLabel")
    else
    @accounts = []
    #Twitteraccount.all.sample(5).pluck(:name, :username)
    #['mrs baozi','mrs__baozi']
    @nb=20
    end
    @mytweets ||= []
    @tweets = @accounts.map {|x| $client.user_timeline(x[1],count:@nb)}.flatten#+$client.search("baozi").take(100)
    @tweets += @mytweets
    @myparams = myparams.to_query
  rescue Twitter::Error::Unauthorized
#    if @account && @account.person
#    redirect_to @account.person, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    else
#    redirect_to twitteraccounts_path, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    end
    @tweets= []
  end
  def listtweet2
    account =params[:userid]
    key =params[:keyword]
    id =params[:myid]
    if account
            @user=User.find_by(params[:userid])
            @account = @user.twitteraccounts[0]
            @accounts = @user.twitteraccounts.pluck(:name, :username)
            @nb=10
            @mytweets = (key && key.length > 0 ? $client.search(key,count: @nb).take(@nb) : []).map {|x| x}
            @mytweets += (id.to_i > 0 ? [$client.status(id.to_i)] : []).map {|x| x}
            @mycurrenttweet = Mytweet.new("https://twitter.com/i/api/2/timeline/conversation/#{id}.json?include_profile_interstitial_type=1&include_blocking=1&include_blocked_by=1&include_followed_by=1&include_want_retweets=1&include_mute_edge=1&include_can_dm=1&include_can_media_tag=1&skip_status=1&cards_platform=Web-12&include_cards=1&include_ext_alt_text=true&include_quote_count=true&include_reply_count=1&tweet_mode=extended&include_entities=true&include_user_entities=true&include_ext_media_color=true&include_ext_media_availability=true&send_error_codes=true&simple_quoted_tweet=true&referrer=tweet&count=20&cursor=LBl2gsC1meDcy/0hgsC9ocnyvf0hgMC0+Ybptv0hgoC/hYij2v0hgsC0sbzH2f0hgoC/2bOgtv0hgMCmsaL/1v0hJQISAAA=&include_ext_has_birdwatch_notes=false&ext=mediaStats,highlightedLabel")
    else
    @accounts = []
    #Twitteraccount.all.sample(5).pluck(:name, :username)
    #['mrs baozi','mrs__baozi']
    @nb=10
    end
    @mytweets ||= []
    @tweets = @accounts.map {|x| $client.user_timeline(x[1],count:@nb)}.flatten#+$client.search("baozi").take(100)
    @tweets += @mytweets
    @myparams = myparams.to_query
  rescue Twitter::Error::Unauthorized
#    if @account && @account.person
#    redirect_to @account.person, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    else
#    redirect_to twitteraccounts_path, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    end
    @tweets= []
  end
  def myparams
    params.permit(:taccount,:keyword, :myid)
  end
end
