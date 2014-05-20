require 'spec_helper'

feature 'Posts' do
	scenario 'Shows all posts' do
		posts = []
		10.times do
			posts << FactoryGirl.create(:post)
		end
		visit root_path
		posts.each do |post|
			expect(page).to have_content post.title
		end
	end
end