require "rails_helper"

RSpec.describe Account::UsersController, type: :controller do
  it do
    is_expected.to permit(:email, :password, :password_confirmation)
                     .for(:create, params: params)
                     .on(:user)
  end

  describe "GET #new" do
    it { is_expected.to render_template :new }
    it { expect(assign(:user)).to be_a_new User }
  end

  describe "POST #create" do
    context "when params is valid" do
      let(:user) { build :user }
      before { post :create, params: { user: user } }

      it { is_expected.to set_flash[:notice] }
      it { is_expected.to redirect_to { root_url } }
      it { expect(user).to be_persisted  }
    end

    context "when params is invalid" do
      let(:user) { build :user }
      before { user.email = nil }

      it { is_expected.to set_flash[:alert] }
      it { is_expected.to render_template :new }
    end
  end

  describe "GET #show" do
    context "when user is exist" do
      it { is_expected.to render_template :show }
    end

    context "when user is not exist" do
      it { is_expected.to redirect_to { root_url } }
    end

    context "when requested user is not current user" do
      it { is_expected.to redirect_to { root_url } }
    end
  end
end
