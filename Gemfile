source 'http://rubygems.org'

gem 'rails', '3.0.5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3-ruby', :require => 'sqlite3'

# install mysql via dmg:
# http://geryit.com/blog/2011/01/installing-mysql-with-rails-on-mac-os-x-snow-leopard/
# and then:
# export ARCHFLAGS="-arch x86_64" ; sudo gem install --no-rdoc --no-ri ruby-mysql -- --with-mysql-dir=/usr/local --with-mysql-config=/usr/local/mysql/bin/mysql_config
# for native bindings on mac
gem 'ruby-mysql'
gem 'paperclip'
gem "acts_as_list"

# Use unicorn as the web server
#gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
#gem 'ruby-debug'
gem 'launchy'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

gem 'haml'
gem 'rails3-generators'
gem "nifty-generators"
gem 'flutie'
#gem 'compass'

gem 'fastercsv'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end


group :test do
  #gem 'rspec-rails', '2.0.0.beta.11'
  gem "rspec-rails", ">= 2.5.0"
end

group :development do
  #gem "rails-footnotes"
end

group :cucumber do
  gem 'cucumber-rails'
  gem 'capybara'
  gem "rspec"
  #gem 'rspec-rails', '2.0.0.beta.11'
  gem "rspec-rails", ">= 2.5.0"
	gem 'term-ansicolor'
end