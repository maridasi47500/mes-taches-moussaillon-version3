

class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ showtweetrails edit update destroy ]
  before_action :listtweet, only: [:index,:show]
  before_action :listtweet2, only: [:myfeeds]

  # GET /tweets or /tweets.json
  def index
  end
  def myfeeds
    render layout: false
  end

  # GET /tweets/1 or /tweets/1.json
  def show
@tweetrails = Tweet.withtweets(@tweetstwitter)

    

      respond_to do |format|
        format.html
        format.js
    end

  end
  def showtweetrails
    @tweetrails = Tweet.find(myparams[:id])
  end
  #GET /tweets/indextweetrails
  def indextweetrails
    @tweetsrails = Tweet.all
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to showtweetrails_tweet_path(@tweet.id), notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end
  def newtweet
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { render :showmytweet, layout: false, notice: "Tweet was successfully created." }
      else
        format.html { render :new, layout: false, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to showtweetrails_tweet_path(@tweet.id), notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def myparams
    params.permit(:taccount,:keyword, :myid,:id)
  end

  def listtweet
@tweetstwitter=Tweet.findtweets1(params[:taccount],params[:keyword],params[:myid],params[:tlang])

    @myparams = myparams.to_query
  rescue Twitter::Error::NotFound
    @tweetstwitter= []
  rescue Twitter::Error::Unauthorized
#    if @account && @account.person
#    redirect_to @account.person, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    else
#    redirect_to twitteraccounts_path, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    end
    @tweetstwitter= []
  end
  def listtweet3
    account =params[:userid]
    key =params[:keyword]
    id =params[:myid]
@tweetstwitter=Tweet.findtweets2(params[:userid],params[:keyword],params[:myid])

    @myparams = myparams.to_query
  rescue Twitter::Error::NotFound
    @tweetstwitter= []
  rescue Twitter::Error::Unauthorized
#    if @account && @account.person
#    redirect_to @account.person, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    else
#    redirect_to twitteraccounts_path, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    end
    @tweetstwitter= []
  end
  def listtweet2
    account =params[:userid]
    key =params[:keyword]
    id =params[:myid]
@tweetstwitter=Tweet.findtweets2(params[:userid],params[:keyword],params[:myid])

    @myparams = myparams.to_query
  rescue Twitter::Error::NotFound
    @tweetstwitter= []
  rescue Twitter::Error::Unauthorized
#    if @account && @account.person
#    redirect_to @account.person, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    else
#    redirect_to twitteraccounts_path, notice: "you're not authorized to go on #{@account.name} (#{@account.username})'s account"
#    end
    @tweetstwitter= []
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweetrails = Tweet.find(params[:id]) rescue nil
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :username, :created_at, :place)
    end
end
