require 'rails_helper'

describe PostsController, type: :controller do
    describe '#index' do
      it 'should return success response for index' do
          get :index 
          expect(response).to have_http_status(:ok)  
      end

      it 'should return success response for show' do
          get :show, params: { id: 1 }
          expect(response).to have_http_status(:ok)  
      end
    end
end 