require 'rails_helper'

RSpec.describe "Posts", type: :request do

  post_1 = {
    title: 'my diary',
    content: 'In this post — this ultimate, step-by-step guide — we’ll share tips used by professional freelance writers to create spellbinding posts that are adored by thousands. You’ll learn the secrets to crafting irresistible headlines, seducing introductions, captivating advice, and motivational closings.

    You’ll even learn how the pros refine and polish their posts once they’re finished writing them.
    
    These are secrets many bloggers would gladly pay real money to learn, but it won’t cost you a thing — other than a few minutes of your time.'
  }

  bad_post = {
    title: '',
    content: 'bleh, blah!'
  }

  post_edit = {
    title: 'an edit was made'
  }

  describe "GET /index" do
    it 'gets all posts' do
    Post.create(post_1)
    posts = Post.create(post_1)
    get '/posts'
    posts = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it 'shows a single post' do
      post = Post.create(post_1)
      blog1 = Post.last
      get "/posts/#{blog1.id}"
      post = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it 'creates a single post' do
      post '/posts', params: {post: post_1}
      blog1 = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "UPDATE /posts/:id" do
    it 'updates a single post' do
      Post.create(post_1)
      blog1 = Post.last
      patch "/posts/#{blog1.id}", params: {post: post_edit}
      blog1 = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /posts/:id" do
    it 'deletes a single post' do
      blog1 = Post.create(post_1)
      delete "/posts/#{blog1.id}"
      blog1 = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

end
