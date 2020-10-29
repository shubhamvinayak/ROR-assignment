require 'net/http'
class CommentsController < ApplicationController
    def index
         render json: fetch_comments
    end

    def show 
        render json: fetch_comments_by_id
    end

    private

    def fetch_comments
        JSON.parse(Net::HTTP.get(URI(base_url+"/posts/#{params[:post_id]}/comments")))        
    end     

    def fetch_comments_by_id
        JSON.parse(Net::HTTP.get(URI(base_url+"/comments?postId=#{params[:id]}")))        
    end  
end