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

	describe 'GET show' do
		before :each do
			@post = FactoryGirl.create(:post)
			get :show, id: @post.id
		end

		it 'is successful' do
			expect(response).to be_success
		end

		it 'assigns post' do
			expect(assigns(:post)).to eq @post
		end
	end

	describe 'GET new' do
		before :each do
			get :new
		end

		it 'is successful' do
			expect(response).to be_success
		end

		it 'assigns post' do
			expect(assigns(:post)).is_a? Post
		end
	end
end
