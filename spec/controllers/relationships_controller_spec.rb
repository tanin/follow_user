require 'rails_helper'

describe RelationshipsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'POST create' do
    context 'when logged out' do
      it 'redirects to login page' do
        post :create, params: { followed_id: 1, format: :js }
        expect(response).to redirect_to(login_path)
      end
    end

    context 'when logged in' do
      before do
        login_as(user)
        post :create, params: { format: :js, followed_id: other_user.id }
      end

      it 'returns success' do
        expect(response).to be_successful
      end

      it 'respond js' do
        expect(response.content_type).to eq('text/javascript')
      end

      it 'creates followed' do
        expect(user.reload.following.count).to eq(1)
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when logged out' do
      it 'redirects to login page' do
        delete :destroy, params: { id: 1, format: :js }
        expect(response).to redirect_to(login_path)
      end
    end

    context 'when logged in' do
      let(:relationship) { create(:relationship, followed: other_user, follower: user) }

      before do
        login_as(user)
        delete :destroy, params: { format: :js, id: relationship.id, followed_id: other_user.id }
      end

      it 'returns success' do
        expect(response).to be_successful
      end

      it 'respond js' do
        expect(response.content_type).to eq('text/javascript')
      end

      it 'creates followed' do
        expect(user.reload.following.count).to eq(0)
      end
    end
  end
end
