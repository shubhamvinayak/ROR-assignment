require 'rails_helper'

describe CommentsController, type: :controller do
    describe '#index' do
      it 'should return success response for index' do
          get :index , params: { post_id: 1 }
          expect(response).to have_http_status(:ok)  
      end

      it 'should return success response for show' do
          get :show, params: { post_id: 1,id: 1 }
          expect(response).to have_http_status(:ok)  
      end
    end
end