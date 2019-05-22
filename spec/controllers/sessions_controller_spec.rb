require 'rails_helper'

describe SessionsController, type: :controller do
  let(:user) { create(:user, password: 'mnb007') }

  describe 'GET new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    context 'when successful' do
      before do
        post :create, params: { login: { email: user.email, password: 'mnb007' } }
      end

      it 'redirects to root' do
        expect(response).to redirect_to(root_path)
      end

      it 'sets user_id coockie' do
        expect(session[:user_id]).to eq(user.id.to_s)
      end

      it 'flashes successful login' do
        expect(flash[:notice]).to match(/Successfully logged in!/)
      end
    end

    context 'when failure' do
      before do
        post :create, params: { login: { email: user.email, password: '' } }
      end

      it 'renders new template' do
        expect(response).to render_template(:new)
      end

      it 'flashes alert' do
        expect(flash[:alert]).to match(/Incorrect email or password, try again/)
      end

      it 'does not set user_id coockie' do
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      login_as(user)

      delete :destroy
    end

    it 'redirects to login' do
      expect(response).to redirect_to(login_path)
    end

    it 'sets user_id coockie to nil' do
      expect(session[:user_id]).to be_nil
    end
  end
end
