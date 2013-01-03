# Including strong_parameters gem by default
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
