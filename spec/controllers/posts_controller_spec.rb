require 'spec_helper'

describe PostsController do
	describe 'GET index' do
		it 'is successful' do
			get :index
			expect(response).to be_success
		end

		it 'assigns posts' do
			posts = []
			10.times do
				posts << FactoryGirl.create(:post)
			end
			get :index
			expect(assigns(:posts)).to eq posts
		end
	end
end
