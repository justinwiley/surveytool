Surveytool::Application.configure do
  config.generators do |g|
    g.template_engine :haml
    g.integration_tool :rspec
    g.test_framework   :rspec
  end
end
