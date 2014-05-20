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

	scenario 'Shows individual post' do
		post = FactoryGirl.create(:post)

		visit post_path id: post.id
		expect(page).to have_content post.title
		expect(page).to have_content post.body
	end

	scenario 'Creates a new post' do
		post_attributes = FactoryGirl.attributes_for(:post)

		visit new_post_path
		save_and_open_page
		fill_in 'Title', with: post_attributes[:title]
		fill_in 'Body', with: post_attributes[:body]
		click_button 'Create Post'
		expect(page).to have_content post_attributes[:title]
		expect(page).to have_content post_attributes[:body]
	end
end