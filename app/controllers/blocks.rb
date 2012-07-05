Jtt.controllers :blocks do

  get :show, :map => '/show/:id' do
    @block = ActiveSupport::JSON.decode(
        RestClient.get("http://are.na/api/v1/blocks/#{params[:id]}", { :accept => :json })
      )

    render "blocks/show"
  end

end
