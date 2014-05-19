require 'spec_helper'

feature 'Posts' do
	scenario 'Shows all posts' do
		post = FactoryGirl.create(:post)
		visit root_path
		expect(page).to have_content post.title
	end
end