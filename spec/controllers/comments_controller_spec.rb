require 'rails_helper'

RSpec.describe CommentsController, type: :controller do


  describe "#create" do

    let(:idea) {create(:idea)}
    let(:comment) {create(:comment)}
    let(:user) {create(:user)}

    context "user must be logged in" do
      it "should redirect to the sign in page" do
        post :create, idea_id: idea.id
        expect(response).to redirect_to(new_session_path)
      end
    end

    context "with valid params" do

      def valid_request
        post :create, {idea: idea, comment: comment}
      end

      it "should make a new entry into the database" do
        count_before = Comment.count
        valid_request
        count_after = Comment.count
        expect(count_after).to eq( count_before + 1 )
      end

      it "should redirect to the show idea path" do
        valid_request
        expect(response).to redirect_to(idea_path(idea))
      end
    end

    context "with invalid params" do

      def invalid_request
       post :create, params: {body: ''}
      end

      it "should not make a new entry into the database" do
        count_before = Comment.count
        invalid_request
        count_after = Comment.count
        expect(count_after).to eq( count_before )
      end

      it "should redirect to the show idea path" do
        invalid_request
        expect(response).to redirect_to(idea_path(idea))
      end
    end
  end

  describe "#destroy" do
    let!(:comment) {create(:comment)}
    context "user is not logged in" do
      it "should redirect to the sign in page" do
        delete :destroy, {idea_id: idea.id, id: comment.idea.id}
        expect(response).to redirect_to(new_session_path)
      end
    end
  end
end
