require 'capybara/rspec'

RSpec.configure do |config|
    config.before(:each, type: :system) do
            driven_by :selenium, using: :headless_chrome, options: {
        browser: :remote,
        url: ENV.fetch("SELENIUM_DRIVER_URL"),
        desired_capabilities: :chrome
    }
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 3001
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
    end
end