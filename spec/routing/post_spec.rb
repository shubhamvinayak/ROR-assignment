require 'rails_helper'

describe 'routes', :type=> :routing do
    context "validating post routes for index and show" do    
    it 'should routes to post index' do
        expect(get '/posts').to route_to('posts#index')
    end

    it 'should routes to post show' do
        expect(get '/posts/1').to route_to('posts#show', id: '1')
    end
    end

    context "validating comments route for index and show" do
        it 'should routes to comment index' do
            expect(get '/posts/1/comments').to route_to('comments#index', post_id: '1')
        end

        it 'should routes to comments show' do
            expect(get '/posts/1/comments/1').to route_to('comments#show', post_id:'1', id: '1')
        end
    end    
end