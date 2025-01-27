# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Group1
  # Group1::Application is the main application class for Group1.
  # It inherits from Rails::Application and is responsible for
  # configuring the application's settings and behavior.
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # 2025_01_25_追加（rails g ... コマンドの設定）
    # commit名変更用
    config.generators.system_tests = nil
    config.generators do |g|
      g.skip_routes true # ルーティングの記述を加えないようにする
      g.helper false # ヘルパーファイルを自動生成しないようにする
      g.test_framework nil # テストフレームワークを使わないようにする
    end

    config.i18n.default_locale = :ja
    config.time_zone = "Tokyo"
  end
end
