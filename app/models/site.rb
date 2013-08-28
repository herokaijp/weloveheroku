class Site < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
end
