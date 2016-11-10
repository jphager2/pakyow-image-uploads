Pakyow::App.routes do
  default do
    view.scope(:image).bind({}) do |view, data|
      view.attrs.action = router.group(:images).path(:create)
      view.attrs.method = 'POST'
    end
    view.scope(:'uploaded-image').apply(Image.all)
  end

  namespace :images, 'images' do
    post :create, '/' do
      Image.create(params[:image])

      redirect('/')
    end
  end

  # define application routes here
end
