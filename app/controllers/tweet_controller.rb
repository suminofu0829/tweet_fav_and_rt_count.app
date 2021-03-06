class TweetController < ApplicationController

  def index
    range = Date.today.days_ago(7).beginning_of_day..Date.today.end_of_day
    @tweets = Tweet.where(tweet_time: range).order(tweet_point: :desc).page(params[:page]).per(200)
  end

  def timeline
    range = Date.today.days_ago(7).beginning_of_day..Date.today.end_of_day
    @tweets = Tweet.where(tweet_time: range).order(tweet_time: :desc).page(params[:page]).per(200)
  end

  def followers_count
    range = Date.today.days_ago(7).beginning_of_day..Date.today.end_of_day
    @tweets = Tweet.where(tweet_time: range).order("followers_count desc,tweet_time desc, followers_count is null asc").page(params[:page]).per(200)
  end

  def about
  end

  before_action :authenticate_user!, except: [:index,:timeline,:about]

end
