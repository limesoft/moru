# RailsAdmin config file. Generated on January 18, 2013 12:04
# See github.com/sferik/rails_admin for more informations


RailsAdmin.config do |config|

  require 'i18n'
  I18n.default_locale = :en

  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['MORU', 'Admin']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_admin } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, 'Admin'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'Admin'

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Authentication', 'Comment', 'Event', 'Post', 'Rsvp', 'Topic', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['Authentication', 'Comment', 'Event', 'Post', 'Rsvp', 'Topic', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:

  ###  Event  ###

  # config.model 'Event' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your event.rb model definition

  #   # Found associations:

  #     configure :comments, :has_many_association 
  #     configure :with_going, :has_many_association 
  #     configure :rsvps, :has_many_association 
  #     configure :users, :has_many_association 
  #     configure :topics, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #configure :title, :string 
  #configure :content, :text 
  #     configure :latitude, :float 
  #     configure :longitude, :float 
  #configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #configure :date, :datetime 
  #configure :comments_count, :integer 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #weight 3                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #list do
  #    field :title
  #    field :content
  #    field :date
  #    field :comments_count
  # end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  #end


  ###  Post  ###

  # config.model 'Post' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your post.rb model definition

  #   # Found associations:

  # configure :comments, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :title, :string 
  #     configure :content, :text 
  #     configure :comments_count, :integer 
  #     configure :user_id, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #list do
  #    field :title
  #    field :content
  #    field :user_id
  #    field :created_at
  #  end

  #  edit do
  #    field :content, :text do
  #      bootstrap_wysihtml5 true
  #    end
  #  end
  #end


  ###  Rsvp  ###

  # config.model 'Rsvp' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your rsvp.rb model definition

  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :event, :belongs_to_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :going, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :event_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Topic  ###

  #config.model 'Topic' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your topic.rb model definition

  #   # Found associations:

  #  configure :user, :belongs_to_association 
  #  configure :speaker, :belongs_to_association 
  #     configure :event, :belongs_to_association 
  #     configure :votes, :has_many_association         # Hidden 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :content, :text 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :speaker_id, :integer         # Hidden 
  #     configure :event_id, :integer         # Hidden 
  #     configure :title, :string 
  #     configure :cached_votes_total, :integer 
  #     configure :cached_votes_up, :integer 
  #     configure :cached_votes_down, :integer 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  # list do
  #    field :title
  #    field :content
  #    field :user_id
  #end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

  #   # Found associations:

  #     configure :authentications, :has_many_association 
  #     configure :comments, :has_many_association 
  #     configure :topics, :has_many_association 
  #     configure :assigned_topics, :has_many_association 
  #     configure :rsvps, :has_many_association 
  #     configure :events, :has_many_association 
  #     configure :votes, :has_many_association         # Hidden 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :role, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
