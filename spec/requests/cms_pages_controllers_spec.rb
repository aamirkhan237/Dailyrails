require 'rails_helper'

RSpec.describe "CmsPagesControllers", type: :request do
  describe "GET /pages/:slug" do
    let(:cms_page) { create(:cms_page) }

    context "when the page exists" do
      it "renders the page" do
        get cms_page_path(cms_page.slug)
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
        expect(assigns(:cms_page)).to eq(cms_page)
      end
    end
  end
end
