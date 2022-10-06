class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        logger.debug @tweets.count
    end
    
    def new
        @tweet = Tweet.new
    end
    
    def show
        @tweet = Tweet.find(params[:id])
    end
    
    def create
        message = params[:tweet][:message]
        file = params[:tweet][:file].read
        time = Time.current
        @tweet = Tweet.new(message: message, file: file, tdate: time)
        if @tweet.save
            flash[:notice] = '1レコード追加しました'
            redirect_to root_path
        else
            render new_tweet_path
        end
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to root_path
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        message = params[:tweet][:message]
        file = params[:tweet][:file].read
        @tweet.update(message: message ,file: file)
        redirect_to root_path
    end
    
    def get_tweet
        tweet = Tweet.find(params[:id]) #↓詳細は説明を後述する
        send_data tweet.file, disposition: :inline, type: 'tweet/png'
    end
end
