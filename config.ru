# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.
# commit名変更用
require_relative 'config/environment'

run Rails.application
Rails.application.load_server
