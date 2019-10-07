require 'rails_helper'
require 'spec_helper'
require 'byebug'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do   
      subject { get :new }

      it 'renders the new template' do 
        expect(subject).to render_template("new")
      end
    end

    describe 'GET #show' do
      it 'renders the show template' do 
        get :show, params: { id: user_id }
        expect(response).to render_template(:show)
      end
    end

    describe 'GET #index' do 
      it 'renders the index template' do 
        get :index 
        expect(response).to render_template(:index)
      end
    end

    describe 'POST #create' do    
      context 'with valid params' do 
        it 'redirects user to show page' do 
          post :create, params: { user: {username: 'Jack', password: 'hunter2'}}
          expect(response).to redirect_to(user_url(User.last))
        end

        it 'logs in the user' do 
          post :create, params: { user: {username: 'Jack', password: 'hunter2'}}
        #   user = User.find_by( username: 'Jack')
        #   ApplicationController.new.login!(user)
          #debugger
          expect(session[:session_token]).to eq(User.last.session_token)
        end
      end

      context 'with invalid params' do 
        it 'flashes an error message and renders a new page with empty params' do
            post :create, params: { user: {username: 'Jack', password: ''}}
            expect(response).to render_template(:new)
            expect(flash[:errors]).to be_present 
        end
        
        it 'flashes an error message and renders a new page with a short password (length < 6)' do
            post :create, params: { user: {username: 'Jack', password: '123'}}
            expect(response).to render_template(:new)
            expect(flash[:errors]).to be_present 
        end
      end
    end
end

