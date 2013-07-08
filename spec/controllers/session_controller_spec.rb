require 'spec_helper'

describe SessionsController do
  before(:each) do
    Rails.application.routes.draw do
      resource :sessions, :only => [:create, :destroy]
      root to: 'site#index'
    end
  end

  after(:each) do
    Rails.application.reload_routes!
  end

  describe '#create' do
    it 'logs in a new user' do
      @request.env['omniauth.auth'] = {
        'provider' => 'twitter',
        'info' => {'name' => "Nick Hira"},
        'uid' => 'abc123'
      }

      post :create
      user = User.find_by_uid_and_provider('abc123', 'twitter')
      expect(controller.current_user.id).to eq(user.id)
    end

    it "it logs in an existing user" do
      @request.env['omniauth.auth'] = {
        'provider' => 'twitter',
        'info' => {'name' => "John Doe"},
        'uid' => 'def123'
      }

      user = User.create(provider: 'twitter', uid: 'def123', name: "John Doe")

      post :create
      expect(controller.current_user.id).to eq(user.id)
    end

    it 'redirects to the companies page' do
      @request.env['omniauth.auth'] = {
        'provider' => 'twitter',
        'info' => {'name' => "John Doe"},
        'uid' => 'def123'
      }

      user = User.create(provider: 'twitter', uid: 'def123', name: "John Doe")

      post :create
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#destroy' do
    it 'logs out user' do
      @request.env['omniauth.auth'] = {
        'provider' => 'twitter',
        'info' => {'name' => "John Doe"},
        'uid' => 'def123'
      }

      user = User.create(provider: 'twitter', uid: 'def123', name: "John Doe")

      post :create
      delete :destroy
      expect(controller.current_user.id).to_not eq(user.id)
    end
  end
end