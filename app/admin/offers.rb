ActiveAdmin.register Offer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :advertiser_name, :url, :description, :starts_at, :ends_at, :premium, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:advertiser_name, :url, :description, :starts_end, :ends_at, :premium]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.object.starts_at = DateTime.now
    f.inputs do
      f.input :premium, as: :boolean
      f.input :advertiser_name
      f.input :description, as: :text
      f.input :url
      f.input :starts_at
      f.input :ends_at
      f.input :status, as: :select, collection: Offer.statuses.keys

      f.actions
    end
  end
end
