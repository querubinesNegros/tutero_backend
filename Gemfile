source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#gem 'will_paginate', '~> 3.1.0'

#to populate the database
#gem 'faker', '~> 1.9', '>= 1.9.1'
#carrierwve google storage


#pdf generation
gem 'prawn'
gem 'prawn-table'

#A Ruby library to plot charts in PDF files
gem 'squid', '~> 1.2'

#Queuing backend for active job
#gem 'sidekiq'

# Reduces boot times through caching; required in config/boot.rb
#gem 'bootsnap', '>= 1.1.0', require: false
gem 'faker', '~> 1.9', '>= 1.9.1'
gem 'will_paginate', '~> 3.1.0'
# Esta gema nos permite habilita "has_secure_password" en Active Record
gem 'bcrypt', '~> 3.1.7'

# Usamos Rack CORS para habiliar Cross-Origin Resource Sharing (CORS)
gem 'rack-cors'
 
gem 'fog', '1.38.0'
gem 'mini_magick'
gem 'google-cloud'
# Usamos knock para autenticar con el JWT
gem 'knock'
gem 'carrierwave', '~> 1.0'
# Usamos Active Model Serializers para definir las respuestas del API en JSON
gem 'active_model_serializers'# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'annotate'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]