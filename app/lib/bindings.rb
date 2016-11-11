Pakyow::App.bindings do
  scope :image do
    restful :image
  end

  scope :'uploaded-image' do
    binding :file do
      part :src do
        bindable.file.thumb.url if bindable.file.present?
      end
    end
  end
end
