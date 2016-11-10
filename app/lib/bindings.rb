Pakyow::App.bindings do
  # define bindings here
  scope :'uploaded-image' do
    binding :file do
      part :src do
        bindable.file.thumb.url if bindable.file.present?
      end
    end
  end
end
