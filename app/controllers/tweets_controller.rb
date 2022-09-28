class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
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
            redirect_to '/'
        else
            render 'new'
        end
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to '/'
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        message = params[:tweet][:message]
        file = params[:tweet][:file].read
        @tweet.update(message: message ,file: file)
        if @tweet.save
            flash[:notice] = '1レコード追加しました'
            redirect_to '/'
        else
            render 'new'
        end
    end
    
    def get_tweet
        tweet = Tweet.find(params[:id]) #↓詳細は説明を後述する
        send_data tweet.file, disposition: :inline, type: 'tweet/png'
    end
end
