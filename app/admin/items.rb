ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :quantity, :price, :store_id, :category_id, :image

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.inputs do
        f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
  end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :quantity, :price, :store_id, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
