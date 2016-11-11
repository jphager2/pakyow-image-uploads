Pakyow::App.routes do
  get '/' do
    view.scope(:image).bind(Image.new)
    view.scope(:'uploaded-image').apply(Image.all)
  end

  restful :image, 'images' do
    create do
      Image.create(params[:image])

      redirect('/')
    end
  end
end
