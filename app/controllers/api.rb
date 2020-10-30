# frozen_string_literal: true

require 'net/http'

# module to call external API's
module Api
  @base_url = 'http://jsonplaceholder.typicode.com'

  def self.jsonplaceholder
    posts = JSON.parse(Net::HTTP.get(URI(@base_url + '/posts/')))
    users = JSON.parse(Net::HTTP.get(URI(@base_url + '/users/')))
    comments = JSON.parse(Net::HTTP.get(URI(@base_url + '/comments/')))
    output_array = []

    posts.each do |post|
      postId = post['id']
      postName = post['title']
      postContent = post['body']
      temp_hash = {
        "id": postId,
        "name": postName,
        "content": postContent,
        "authorName": '',
        "authorContact": '',
        "comments": []
      }

    users.each do |user|
      temp_hash['authorName'] = user['username']
      temp_hash['authorContact'] = user['email']
     end

    comments.each do |comment|
      next unless comment['postId'] == postId
        comment_hash = {
          "id": comment['id'],
          "name": comment['name'],
          "comment": comment['body'],
          "contact": comment['email']
        }
        temp_hash[:comments] << comment_hash
    end
        output_array << temp_hash
    end
    output_array
  end
end
