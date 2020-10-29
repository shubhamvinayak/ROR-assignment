require 'net/http'
require 'json'

class PostsController < ApplicationController
    
    def index 
      render json: fetch_posts
    end

    def show 
      render json: fetch_posts[(params[:id].to_i)-1]
    end

    private

    def fetch_posts
        response=JSON.parse(Net::HTTP.get(URI(base_url+'/posts')))      
        response.each do |value| 
             value.delete("userId")
             value.delete("title")
            # user= JSON.parse(Net::HTTP.get(URI(base_url+"/users/#{value["id"]}")))             
            #  value["name"]=user["username"]
            #  value["content"] = value.delete("body")
            #  value["authorName"] = user["name"]
            #  value["authorContact"]=user["email"]
        
            #  comments=JSON.parse(Net::HTTP.get(URI(base_url+"/comments/#{value["id"]}"))) 
            #  value["comments"]=[
            #    {
            #     "id": comments["postId"],
            #     "comment": comments["body"],
            #     "name": comments["name"],
            #     "contact": comments["email"]

            #    }
            #  ]
             
        end
    end

    # def fetch_posts_by_id
    #     response=JSON.parse(Net::HTTP.get(URI(base_url+"/posts/#{params[:id]}")))  
    #         #  response.delete("userId")
    #         #  response.delete("title")
        
    #         # user= JSON.parse(Net::HTTP.get(URI(base_url+"/users/#{params[:id]}")))   
    #         #  response["name"]=user["username"]
    #         #  response["content"] = response.delete("body")
    #         #  response["authorName"] = user["name"]
    #         #  response["authorContact"]=user["email"]
        
    #         #  comments=JSON.parse(Net::HTTP.get(URI(base_url+"/comments/#{params[:id]}"))) 
    #         #  response["comments"]=[
    #         #    {
    #         #     "id": comments["postId"],
    #         #     "comment": comments["body"],
    #         #     "name": comments["name"],
    #         #     "contact": comments["email"]

    #         #    }
    #         #  ]
 
    # end
    
    
end