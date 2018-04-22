RSpec.describe SearchController, type: :controller do

  describe 'When User Search photos' do

    it "should reture result correctly" do
      response = [{:id => "40905047114", :secret => "f73005421d", :server => "908", :farm => 1, :title => "test123"}]
      allow_any_instance_of(Flickr::Api).to receive_message_chain(:photos, :search).and_return(response);
      get :index, params:{page: 1, search: "test"}
      expect(response.count).to eq 1
      expect(response).to render_template(:index)
    end

    it "should return error" do 
      allow_any_instance_of(Flickr::Api).to receive_message_chain(:photos, :search).and_return(StandardError);
      get :index, params:{page: 1, search: "test"}
      expect(response).to redirect_to :root
      expect(flash[:error]).to be_present
    end
 
    it "should return error" do
      get :index, params:{page: 1, search: ""}
      expect(response).to redirect_to :root
      expect(flash[:error]).to be_present
      
    end
  end
end