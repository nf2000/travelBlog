class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  add_flash_types :info, :error, :warning
end
