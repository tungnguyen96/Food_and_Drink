require "rails_helper"

RSpec.describe Account::SessionsController, type: :controller do
  describe "GET #new" do
    context "when user is signed in" do
      it { is_expected.to redirect_to { root_url } }
    end

    context "when user is not signed in" do
      it { is_expected.to render_template :new }
    end
  end

  describe "POST #create" do
    context "when email & password are valid" do
      pending "need setup env"

      it { is_expected.to set_session }
      it { is_expected.to set_flash[:notice] }
      it { is_expected.to redirect_to { root_url } }
    end

    context "when email or password are invalid" do

    end
  end

  describe "DELETE #destroy" do
    context "when user is signed in" do
    end

    context "when user is not signed in" do
    end
  end
end
