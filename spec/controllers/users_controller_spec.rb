require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET index' do
    context 'when logged out' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to(login_path)
      end
    end

    context 'when logged in' do
      before do
        login_as(user)
      end

      context 'when logged in' do
        before do
          get :index
        end

        it 'returns a successful response' do
          expect(response).to be_successful
        end

        it 'assigns @users' do
          expect(assigns(:users)).to eq([user])
        end

        it 'renders the index template' do
          expect(response).to render_template("index")
        end
      end
    end
  end
end
