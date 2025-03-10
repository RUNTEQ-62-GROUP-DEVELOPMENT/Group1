# frozen_string_literal: true

# ApplicationRecord is the base class for all models in the application.
# It provides shared functionality for all ActiveRecord models.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
