class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:edit, :update, :show, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to @tweet, notice: 'You just tweeted!'
    else
      render :new
    end
  end

  def edit
    # @tweet = Tweet.find(params[:id])
  end

  def update
    # @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Your tweet has been updated.'
    else
      flash.now[:alert] = 'There was a problem updating your Tweet.'
      render :edit
    end
  end

  def show
    # @tweet = Tweet.find(params[:id])
  end

  def destroy
    if @tweet.destroy
      redirect_to tweets_url, notice: 'Tweet destroyed.'
    else
      flash.now[:alert] = 'Something went wrong. Your tweet escaped destruction. Try again.'
    end

  end

  private

  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
