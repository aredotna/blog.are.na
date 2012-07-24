Jtt.controllers :blocks do

  get :show, :map => "/view/:id" do
    @block = Arena::Client.block(
        params[:e] ? params[:id] : slug_decode(params[:id])
      )
    
    render "blocks/show"
  end

end
