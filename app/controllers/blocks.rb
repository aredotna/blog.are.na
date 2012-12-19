App.controllers :blocks do

  get :show, map: "/view/:id" do
    @block = Arena.block slug_decode(params[:id])
    
    render "blocks/show"
  end

end
