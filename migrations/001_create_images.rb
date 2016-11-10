Sequel.migration do
  up do
    create_table :images do
      String :html_title
      String :file
      DateTime :created_at
      DateTime :updated_at
    end
  end

  down do
    drop_table :images
  end
end

