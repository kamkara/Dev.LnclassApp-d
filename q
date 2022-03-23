[33mcommit c639518a798ff379d57dee8d7f96c5ff020fe9b5[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m, [m[1;31mplatform/main[m[33m)[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Wed Mar 23 10:15:16 2022 +0000

    add 5G and Socket on variables

[1mdiff --git a/.platform.app.yaml b/.platform.app.yaml[m
[1mindex 715f042..fe16444 100644[m
[1m--- a/.platform.app.yaml[m
[1m+++ b/.platform.app.yaml[m
[36m@@ -42,6 +42,7 @@[m [mvariables:[m
         RAILS_ENV: 'production'[m
         RAILS_LOG_TO_STDOUT: '1'[m
         RAILS_TMP: '/tmp'[m
[32m+[m[32m        SOCKET: ''[m
 [m
 # The 'mounts' describe writable, persistent filesystem mounts in the application.[m
 mounts:[m
[36m@@ -105,6 +106,5 @@[m [mweb:[m
         # Send requests to the app server through a unix socket, whose location[m
         # will be defined in an environment variable named SOCKET.[m
         socket_family: "unix"[m
[31m-[m
     commands:[m
         start: 'bundle exec unicorn -l $SOCKET'[m
[1mdiff --git a/.platform/services.yaml b/.platform/services.yaml[m
[1mindex 596d740..4524400 100644[m
[1m--- a/.platform/services.yaml[m
[1m+++ b/.platform/services.yaml[m
[36m@@ -5,4 +5,4 @@[m
 [m
 db:[m
     type: postgresql:13[m
[31m-    disk: 1024[m
[32m+[m[32m    disk: 5120[m
[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex 856ac17..66fb875 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -43,7 +43,7 @@[m [mgem 'devise-encryptable', '~> 0.2.0'[m
 [m
 ############### Deploy    ############[m
 gem 'platform_sh_rails'[m
[31m-gem "unicorn", "~> 6.0", :group => :production[m
[32m+[m[32mgem 'unicorn', '~> 6.1', :group => :production[m
 [m
 # Build JSON APIs with ease [https://github.com/rails/jbuilder][m
 gem "jbuilder"[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex dbe377e..047ca0f 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -296,7 +296,7 @@[m [mDEPENDENCIES[m
   stimulus-rails[m
   turbo-rails[m
   tzinfo-data[m
[31m-  unicorn (~> 6.0)[m
[32m+[m[32m  unicorn (~> 6.1)[m
   web-console[m
   webdrivers[m
 [m

[33mcommit 05b29d274a26acb2304c54adf38ef9501fafbc4a[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 23:27:19 2022 +0000

    config/environments/production: add prod enviroment config

[1mdiff --git a/config/environments/production.rb b/config/environments/production.rb[m
[1mindex 377cc1b..107cee7 100644[m
[1m--- a/config/environments/production.rb[m
[1m+++ b/config/environments/production.rb[m
[36m@@ -18,7 +18,7 @@[m [mRails.application.configure do[m
 [m
   # Ensures that a master key has been made available in either ENV["RAILS_MASTER_KEY"][m
   # or in config/master.key. This key is used to decrypt credentials (and other encrypted files).[m
[31m-  # config.require_master_key = true[m
[32m+[m[32m   config.require_master_key = true[m
 [m
   # Disable serving static files from the `/public` folder by default since[m
   # Apache or NGINX already handles this.[m
[36m@@ -46,7 +46,7 @@[m [mRails.application.configure do[m
   # config.action_cable.allowed_request_origins = [ "http://example.com", /http:\/\/example.*/ ][m
 [m
   # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.[m
[31m-  # config.force_ssl = true[m
[32m+[m[32m   config.force_ssl = true[m
 [m
   # Include generic and useful information about system operation, but avoid logging too much[m
   # information to avoid inadvertent exposure of personally identifiable information (PII).[m
[36m@@ -56,7 +56,7 @@[m [mRails.application.configure do[m
   config.log_tags = [ :request_id ][m
 [m
   # Use a different cache store in production.[m
[31m-  # config.cache_store = :mem_cache_store[m
[32m+[m[32m   config.cache_store = :mem_cache_store[m
 [m
   # Use a real queuing backend for Active Job (and separate queues per environment).[m
   # config.active_job.queue_adapter     = :resque[m

[33mcommit 87def0d0dc7523fdc9a043ea11e9c29b6bca19ca[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 22:29:00 2022 +0000

    add reinstall ruby 3.0.3 ans remove tailwind

[1mdiff --git a/.ruby-version b/.ruby-version[m
[1mdeleted file mode 100644[m
[1mindex b502146..0000000[m
[1m--- a/.ruby-version[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-3.0.2[m
[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex 371e8bd..856ac17 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -25,7 +25,7 @@[m [mgem "turbo-rails"[m
 gem "stimulus-rails"[m
 [m
 # Use Tailwind CSS [https://github.com/rails/tailwindcss-rails][m
[31m-gem "tailwindcss-rails"[m
[32m+[m[32m#gem "tailwindcss-rails"[m
 [m
 #FRIENDLY FOR SLUG[m
 gem 'friendly_id', '~> 5.4', '>= 5.4.2'[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex 0302844..dbe377e 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -240,8 +240,6 @@[m [mGEM[m
     stimulus-rails (1.0.4)[m
       railties (>= 6.0.0)[m
     strscan (3.0.1)[m
[31m-    tailwindcss-rails (2.0.8-x86_64-linux)[m
[31m-      railties (>= 6.0.0)[m
     thor (1.2.1)[m
     tilt (2.0.10)[m
     timeout (0.2.0)[m
[36m@@ -296,7 +294,6 @@[m [mDEPENDENCIES[m
   selenium-webdriver[m
   sprockets-rails[m
   stimulus-rails[m
[31m-  tailwindcss-rails[m
   turbo-rails[m
   tzinfo-data[m
   unicorn (~> 6.0)[m
[36m@@ -304,7 +301,7 @@[m [mDEPENDENCIES[m
   webdrivers[m
 [m
 RUBY VERSION[m
[31m-   ruby 3.0.3[m
[32m+[m[32m   ruby 3.0.3p157[m
 [m
 BUNDLED WITH[m
[31m-   2.3.6[m
[32m+[m[32m   2.2.32[m
[1mdiff --git a/app/assets/builds/.keep b/app/assets/builds/.keep[m
[1mdeleted file mode 100644[m
[1mindex e69de29..0000000[m
[1mdiff --git a/app/assets/config/manifest.js b/app/assets/config/manifest.js[m
[1mindex b06fc42..3100fe7 100644[m
[1m--- a/app/assets/config/manifest.js[m
[1m+++ b/app/assets/config/manifest.js[m
[36m@@ -2,4 +2,4 @@[m
 //= link_directory ../stylesheets .css[m
 //= link_tree ../../javascript .js[m
 //= link_tree ../../../vendor/javascript .js[m
[31m-//= link_tree ../builds[m
[41m+[m
[1mdiff --git a/app/assets/stylesheets/application.tailwind.css b/app/assets/stylesheets/application.tailwind.css[m
[1mdeleted file mode 100644[m
[1mindex 5b204fa..0000000[m
[1m--- a/app/assets/stylesheets/application.tailwind.css[m
[1m+++ /dev/null[m
[36m@@ -1,14 +0,0 @@[m
[31m-@tailwind base;[m
[31m-@tailwind components;[m
[31m-@tailwind utilities;[m
[31m-[m
[31m-[m
[31m-[m
[31m-@layer components {[m
[31m-  .ln--field {[m
[31m-    @apply p-2 rounded-md block border border-gray-200 outline-none px-3 py-2 mt-2 w-full;[m
[31m-  }[m
[31m-}[m
[31m-[m
[31m-[m
[31m-@import 'components/actiontext.css';[m
\ No newline at end of file[m
[1mdiff --git a/config/tailwind.config.js b/config/tailwind.config.js[m
[1mdeleted file mode 100644[m
[1mindex fd336d8..0000000[m
[1m--- a/config/tailwind.config.js[m
[1m+++ /dev/null[m
[36m@@ -1,21 +0,0 @@[m
[31m-const defaultTheme = require('tailwindcss/defaultTheme')[m
[31m-[m
[31m-module.exports = {[m
[31m-  content: [[m
[31m-    './app/helpers/**/*.rb',[m
[31m-    './app/javascript/**/*.js',[m
[31m-    './app/views/**/*'[m
[31m-  ],[m
[31m-  theme: {[m
[31m-    extend: {[m
[31m-      fontFamily: {[m
[31m-        sans: ['Inter var', ...defaultTheme.fontFamily.sans],[m
[31m-      },[m
[31m-    },[m
[31m-  },[m
[31m-  plugins: [[m
[31m-    require('@tailwindcss/forms'),[m
[31m-    require('@tailwindcss/aspect-ratio'),[m
[31m-    require('@tailwindcss/typography'),[m
[31m-  ][m
[31m-}[m

[33mcommit be22c311622867f5bbea3c9505ecca1a4857d02f[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 21:46:48 2022 +0000

    app/views/layouts/application.html: add tailwind cdn

[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex b37b05c..afba8f0 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -11,7 +11,9 @@[m
     <%= csrf_meta_tags %>[m
     <%= csp_meta_tag %>[m
     [m
[31m-    <%= stylesheet_link_tag "tailwind", "inter-font", "data-turbo-track": "reload" %>[m
[32m+[m[32m    <!-- Add Tailwind css CDN-->[m
[32m+[m[32m    <script src="https://cdn.tailwindcss.com"></script>[m
[32m+[m
 [m
     <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>[m
     <%= javascript_importmap_tags %>[m

[33mcommit 8b9912c9330710d520aab029a5ec6bfa31cbc55c[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 21:20:40 2022 +0000

    Add ruby 3.0.3

[1mdiff --git a/.ruby-version b/.ruby-version[m
[1mindex 9f55b2c..b502146 100644[m
[1m--- a/.ruby-version[m
[1m+++ b/.ruby-version[m
[36m@@ -1 +1 @@[m
[31m-3.0[m
[32m+[m[32m3.0.2[m
[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex a384c26..371e8bd 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -1,7 +1,7 @@[m
 source "https://rubygems.org"[m
 git_source(:github) { |repo| "https://github.com/#{repo}.git" }[m
 [m
[31m-ruby "3.0"[m
[32m+[m[32mruby "3.0.3"[m
 [m
 # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"[m
 gem "rails", "~> 7.0.2", ">= 7.0.2.2"[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex bf59cfd..0302844 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -304,7 +304,7 @@[m [mDEPENDENCIES[m
   webdrivers[m
 [m
 RUBY VERSION[m
[31m-   ruby 3.0.2p107[m
[32m+[m[32m   ruby 3.0.3[m
 [m
 BUNDLED WITH[m
    2.3.6[m

[33mcommit d1dbb4f830d537096cf388cc9e69d7c720ed47c5[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 21:18:58 2022 +0000

    add ruby 3.0.2

[1mdiff --git a/.ruby-version b/.ruby-version[m
[1mindex b502146..9f55b2c 100644[m
[1m--- a/.ruby-version[m
[1m+++ b/.ruby-version[m
[36m@@ -1 +1 @@[m
[31m-3.0.2[m
[32m+[m[32m3.0[m
[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex a2cddf6..a384c26 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -1,7 +1,7 @@[m
 source "https://rubygems.org"[m
 git_source(:github) { |repo| "https://github.com/#{repo}.git" }[m
 [m
[31m-ruby "3.0.2"[m
[32m+[m[32mruby "3.0"[m
 [m
 # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"[m
 gem "rails", "~> 7.0.2", ">= 7.0.2.2"[m
[1mdiff --git a/config/credentials.yml.enc b/config/credentials.yml.enc[m
[1mindex fb1dd7c..8f59407 100644[m
[1m--- a/config/credentials.yml.enc[m
[1m+++ b/config/credentials.yml.enc[m
[36m@@ -1 +1 @@[m
[31m-juh7Nnp70drjhZgml6CoY5p664DChASMYKcF+35uHnbParAswrskajC4DQ+F38L2yV/cyFc/nsBDtdDPzVd18vE+jhcggm0IRd5bdbXwFfs9rxLLYMaTlBnUEkfZCvCFE30EpT2r+BT7m3w20Npebez/6BEJ/A7xo7wzRrkrhu5g/6kO12HkKIcaLtaHnBUQ3kcpgrJGAj681of25VwDSvPF9sTjQGzozE0YqJnXZPViheY0k6cz6iEw2olrH8/L6rxL9r4ofGyDMVWW2yAZL98Td4V7Q3Ve+LWe3BJHsWKxYxlQWVr661tgtLvKOkY2o2/hl51/TPWS0/m5GOnm50+YxLfQMzMgQaZ54mbf2XcAHK49+L/viFcJFJHeTMXK+17ItaEyH/61Sa3DsFQSHqkKArf+1yo/YQS5--flUl7me/DC8bZMdI--eYbcZJgAko9Uxa4fA7anRg==[m
\ No newline at end of file[m
[32m+[m[32mSY1cTxnHDDYl48Ijz5dj1dP9vSQkP/uoHXlPA13H/K2eZomEHAERBZPscspEN/zgcKbw/KoH1LYWxRHLyRvPtdwvn8wVAP3wA7wVwYqFPIV9X35PUKKyQIA3ozp7m5WzPl9ida5rtmcDk0Cens/P0/u8geED4PKC2SZCPPHp/ubGXH050K4udSXc276jNNrfUm+S5F6zrbZb7POeqYgzM34OseUYMHz0SdEL83W51msKRlHxqIiKYfSQXaZ0HAq2cOBhvVDES/5hwouAl5SLuXhjVxIlXAsZyHoVFgMpRFgstCpDCg3AgsQQ/+qSfnayrm745AyF1mxlIj+rzObETrrbHcdstyZ+ZYMSY5pCcrDGkCLzIH6bI4RSl4p1SxOT1em1zjt+y/ethKpsVXJQ1F40gk7U2dndkwzDbj4tTULx7EEjBSAHMfiESjk30FtlEhxOZCmImEmSblrecyDVUFiBCLyyUyu7VdP7j+rvpP5hW/DLVTwKemB/niCFl/glEl6a8NalgqEtJSC+rR/XT+0kF3MFpRq+3G5K2GU9grY28GhET5ZS+yDAcD3mLhQ+kGJ943td+0zC04SEFSbrig==--CnZeDLx5DrAa0VZ3--6TCXBge5Y9qpSrYvCeSxJw==[m
\ No newline at end of file[m
[1mdiff --git a/config/database.yml b/config/database.yml[m
[1mindex 467690a..e1dddbb 100644[m
[1m--- a/config/database.yml[m
[1m+++ b/config/database.yml[m
[36m@@ -84,11 +84,16 @@[m [mtest:[m
 # for a full overview on how database connection configuration can be specified.[m
 #[m
 production:[m
[31m-  production:[m
   adapter: postgresql[m
   encoding: unicode[m
[31m-  database: <%= ENV['LNCLASSAPP_DATABASE_NAME'] %>[m
[31m-  username: <%= ENV['LNCLASSAPP_DATABASE_USERNAME'] %>[m
[31m-  password: <%= ENV['LNCLASSAPP_DATABASE_PASSWORD'] %>[m
[31m-  host: <%= ENV['LNCLASSAPP_DATABASE_HOST'] %>[m
[31m-  port: <%= ENV['LNCLASSAPP_DATABASE_PORT'] %>[m
\ No newline at end of file[m
[32m+[m[32m  database_url: postgresdatabase.internal[m
[32m+[m[32m  database_name: main[m
[32m+[m[32m  database_username: main[m
[32m+[m[32m  database_password: main[m
[32m+[m[32m  host: localhost[m
[32m+[m[32m  port: 5432[m
[32m+[m[32m  #database: <%= ENV['LNCLASSAPP_DATABASE_NAME'] %>[m
[32m+[m[32m  #username: <%= ENV['LNCLASSAPP_DATABASE_USERNAME'] %>[m
[32m+[m[32m  #password: <%= ENV['LNCLASSAPP_DATABASE_PASSWORD'] %>[m
[32m+[m[32m  #host: <%= ENV['LNCLASSAPP_DATABASE_HOST'] %>[m
[32m+[m[32m  #port: <%= ENV['LNCLASSAPP_DATABASE_PORT'] %>[m
\ No newline at end of file[m

[33mcommit f2cf87d867f3d3f592d7457f6dda78544b6ed4a4[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 17:30:24 2022 +0000

    add ruby 3.0.2

[1mdiff --git a/.ruby-version b/.ruby-version[m
[1mindex 75a22a2..b502146 100644[m
[1m--- a/.ruby-version[m
[1m+++ b/.ruby-version[m
[36m@@ -1 +1 @@[m
[31m-3.0.3[m
[32m+[m[32m3.0.2[m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex 40a84e1..bf59cfd 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -1,69 +1,69 @@[m
 GEM[m
   remote: https://rubygems.org/[m
   specs:[m
[31m-    actioncable (7.0.2.2)[m
[31m-      actionpack (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    actioncable (7.0.2.3)[m
[32m+[m[32m      actionpack (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       nio4r (~> 2.0)[m
       websocket-driver (>= 0.6.1)[m
[31m-    actionmailbox (7.0.2.2)[m
[31m-      actionpack (= 7.0.2.2)[m
[31m-      activejob (= 7.0.2.2)[m
[31m-      activerecord (= 7.0.2.2)[m
[31m-      activestorage (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    actionmailbox (7.0.2.3)[m
[32m+[m[32m      actionpack (= 7.0.2.3)[m
[32m+[m[32m      activejob (= 7.0.2.3)[m
[32m+[m[32m      activerecord (= 7.0.2.3)[m
[32m+[m[32m      activestorage (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       mail (>= 2.7.1)[m
       net-imap[m
       net-pop[m
       net-smtp[m
[31m-    actionmailer (7.0.2.2)[m
[31m-      actionpack (= 7.0.2.2)[m
[31m-      actionview (= 7.0.2.2)[m
[31m-      activejob (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    actionmailer (7.0.2.3)[m
[32m+[m[32m      actionpack (= 7.0.2.3)[m
[32m+[m[32m      actionview (= 7.0.2.3)[m
[32m+[m[32m      activejob (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       mail (~> 2.5, >= 2.5.4)[m
       net-imap[m
       net-pop[m
       net-smtp[m
       rails-dom-testing (~> 2.0)[m
[31m-    actionpack (7.0.2.2)[m
[31m-      actionview (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    actionpack (7.0.2.3)[m
[32m+[m[32m      actionview (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       rack (~> 2.0, >= 2.2.0)[m
       rack-test (>= 0.6.3)[m
       rails-dom-testing (~> 2.0)[m
       rails-html-sanitizer (~> 1.0, >= 1.2.0)[m
[31m-    actiontext (7.0.2.2)[m
[31m-      actionpack (= 7.0.2.2)[m
[31m-      activerecord (= 7.0.2.2)[m
[31m-      activestorage (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    actiontext (7.0.2.3)[m
[32m+[m[32m      actionpack (= 7.0.2.3)[m
[32m+[m[32m      activerecord (= 7.0.2.3)[m
[32m+[m[32m      activestorage (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       globalid (>= 0.6.0)[m
       nokogiri (>= 1.8.5)[m
[31m-    actionview (7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    actionview (7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       builder (~> 3.1)[m
       erubi (~> 1.4)[m
       rails-dom-testing (~> 2.0)[m
       rails-html-sanitizer (~> 1.1, >= 1.2.0)[m
[31m-    activejob (7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    activejob (7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       globalid (>= 0.3.6)[m
[31m-    activemodel (7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[31m-    activerecord (7.0.2.2)[m
[31m-      activemodel (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    activemodel (7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
[32m+[m[32m    activerecord (7.0.2.3)[m
[32m+[m[32m      activemodel (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
     activerecord-nulldb-adapter (0.8.0)[m
       activerecord (>= 5.2.0, < 7.1)[m
[31m-    activestorage (7.0.2.2)[m
[31m-      actionpack (= 7.0.2.2)[m
[31m-      activejob (= 7.0.2.2)[m
[31m-      activerecord (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    activestorage (7.0.2.3)[m
[32m+[m[32m      actionpack (= 7.0.2.3)[m
[32m+[m[32m      activejob (= 7.0.2.3)[m
[32m+[m[32m      activerecord (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       marcel (~> 1.0)[m
       mini_mime (>= 1.1.0)[m
[31m-    activesupport (7.0.2.2)[m
[32m+[m[32m    activesupport (7.0.2.3)[m
       concurrent-ruby (~> 1.0, >= 1.0.2)[m
       i18n (>= 1.6, < 2)[m
       minitest (>= 5.1)[m
[36m@@ -72,9 +72,9 @@[m [mGEM[m
       public_suffix (>= 2.0.2, < 5.0)[m
     autoprefixer-rails (10.4.2.0)[m
       execjs (~> 2)[m
[31m-    bcrypt (3.1.16)[m
[32m+[m[32m    bcrypt (3.1.17)[m
     bindex (0.8.1)[m
[31m-    bootsnap (1.10.3)[m
[32m+[m[32m    bootsnap (1.11.1)[m
       msgpack (~> 1.2)[m
     bootstrap (5.1.3)[m
       autoprefixer-rails (>= 9.1.0)[m
[36m@@ -94,7 +94,7 @@[m [mGEM[m
       regexp_parser (>= 1.5, < 3.0)[m
       xpath (~> 3.2)[m
     childprocess (4.1.0)[m
[31m-    concurrent-ruby (1.1.9)[m
[32m+[m[32m    concurrent-ruby (1.1.10)[m
     crass (1.0.6)[m
     debug (1.4.0)[m
       irb (>= 1.3.6)[m
[36m@@ -135,7 +135,7 @@[m [mGEM[m
       railties (>= 4.2.0)[m
       thor (>= 0.14, < 2.0)[m
     kgio (2.11.4)[m
[31m-    loofah (2.14.0)[m
[32m+[m[32m    loofah (2.15.0)[m
       crass (~> 1.0.2)[m
       nokogiri (>= 1.5.9)[m
     mail (2.7.1)[m
[36m@@ -166,7 +166,7 @@[m [mGEM[m
     nokogiri (1.13.3-x86_64-linux)[m
       racc (~> 1.4)[m
     orm_adapter (0.5.0)[m
[31m-    pg (1.3.3)[m
[32m+[m[32m    pg (1.3.4)[m
     platform_sh (0.2.11)[m
     platform_sh_rails (0.1.12)[m
       activerecord-nulldb-adapter[m
[36m@@ -179,28 +179,28 @@[m [mGEM[m
     rack (2.2.3)[m
     rack-test (1.1.0)[m
       rack (>= 1.0, < 3)[m
[31m-    rails (7.0.2.2)[m
[31m-      actioncable (= 7.0.2.2)[m
[31m-      actionmailbox (= 7.0.2.2)[m
[31m-      actionmailer (= 7.0.2.2)[m
[31m-      actionpack (= 7.0.2.2)[m
[31m-      actiontext (= 7.0.2.2)[m
[31m-      actionview (= 7.0.2.2)[m
[31m-      activejob (= 7.0.2.2)[m
[31m-      activemodel (= 7.0.2.2)[m
[31m-      activerecord (= 7.0.2.2)[m
[31m-      activestorage (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    rails (7.0.2.3)[m
[32m+[m[32m      actioncable (= 7.0.2.3)[m
[32m+[m[32m      actionmailbox (= 7.0.2.3)[m
[32m+[m[32m      actionmailer (= 7.0.2.3)[m
[32m+[m[32m      actionpack (= 7.0.2.3)[m
[32m+[m[32m      actiontext (= 7.0.2.3)[m
[32m+[m[32m      actionview (= 7.0.2.3)[m
[32m+[m[32m      activejob (= 7.0.2.3)[m
[32m+[m[32m      activemodel (= 7.0.2.3)[m
[32m+[m[32m      activerecord (= 7.0.2.3)[m
[32m+[m[32m      activestorage (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       bundler (>= 1.15.0)[m
[31m-      railties (= 7.0.2.2)[m
[32m+[m[32m      railties (= 7.0.2.3)[m
     rails-dom-testing (2.0.3)[m
       activesupport (>= 4.2.0)[m
       nokogiri (>= 1.6)[m
     rails-html-sanitizer (1.4.2)[m
       loofah (~> 2.3)[m
[31m-    railties (7.0.2.2)[m
[31m-      actionpack (= 7.0.2.2)[m
[31m-      activesupport (= 7.0.2.2)[m
[32m+[m[32m    railties (7.0.2.3)[m
[32m+[m[32m      actionpack (= 7.0.2.3)[m
[32m+[m[32m      activesupport (= 7.0.2.3)[m
       method_source[m
       rake (>= 12.2)[m
       thor (~> 1.0)[m
[36m@@ -240,7 +240,7 @@[m [mGEM[m
     stimulus-rails (1.0.4)[m
       railties (>= 6.0.0)[m
     strscan (3.0.1)[m
[31m-    tailwindcss-rails (2.0.7-x86_64-linux)[m
[32m+[m[32m    tailwindcss-rails (2.0.8-x86_64-linux)[m
       railties (>= 6.0.0)[m
     thor (1.2.1)[m
     tilt (2.0.10)[m

[33mcommit 608982e721f0cb3abd486790441ff008ba9da8fa[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 17:27:00 2022 +0000

    .ruby-version: add rybu version

[1mdiff --git a/.ruby-version b/.ruby-version[m
[1mindex b502146..75a22a2 100644[m
[1m--- a/.ruby-version[m
[1m+++ b/.ruby-version[m
[36m@@ -1 +1 @@[m
[31m-3.0.2[m
[32m+[m[32m3.0.3[m

[33mcommit 9ef7ae52126badb368f45204f009c207240df180[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 17:10:37 2022 +0000

    add platform.sh configurration

[1mdiff --git a/.platform.app.yaml b/.platform.app.yaml[m
[1mnew file mode 100644[m
[1mindex 0000000..715f042[m
[1m--- /dev/null[m
[1m+++ b/.platform.app.yaml[m
[36m@@ -0,0 +1,110 @@[m
[32m+[m[32m# This file describes an application. You can have multiple applications[m
[32m+[m[32m# in the same project.[m
[32m+[m[32m#[m
[32m+[m[32m# See https://docs.platform.sh/user_guide/reference/platform-app-yaml.html[m
[32m+[m
[32m+[m[32m# The name of this app. Must be unique within a project.[m
[32m+[m[32mname: "lnclassapp"[m
[32m+[m
[32m+[m[32m# The runtime the application uses.[m
[32m+[m[32mtype: "ruby:3.0"[m
[32m+[m
[32m+[m[32mdependencies:[m
[32m+[m[32m    nodejs:[m
[32m+[m[32m        yarn: "*"[m
[32m+[m
[32m+[m[32m# The relationships of the application with services or other applications.[m
[32m+[m[32m#[m
[32m+[m[32m# The left-hand side is the name of the relationship as it will be exposed[m
[32m+[m[32m# to the application in the PLATFORM_RELATIONSHIPS variable. The right-hand[m
[32m+[m[32m# side is in the form `<service name>:<endpoint name>`.[m
[32m+[m[32mrelationships:[m
[32m+[m[32m    database: 'db:postgresql'[m
[32m+[m[32m#relationships:[m
[32m+[m[32m#    postgresdatabase: 'dbpostgres:postgresql'[m
[32m+[m[32m# The size of the persistent disk of the application (in MB).[m
[32m+[m[32mdisk: 1024[m
[32m+[m
[32m+[m[32m# Set environment variables to adjust how Rails will run.[m
[32m+[m[32mvariables:[m
[32m+[m[32m    env:[m
[32m+[m[32m        BUNDLE_CACHE_ALL: '1'[m
[32m+[m[32m        BUNDLE_CLEAN: '1'[m
[32m+[m[32m        BUNDLE_DEPLOYMENT: '1'[m
[32m+[m[32m        BUNDLE_ERROR_ON_STDERR: '1'[m
[32m+[m[32m        BUNDLE_WITHOUT: 'development:test'[m
[32m+[m[32m        DEFAULT_BUNDLER_VERSION: "2.2.26" # in case none is mentioned in Gemfile.lock[m
[32m+[m[32m        EXECJS_RUNTIME: 'Node'[m
[32m+[m[32m        NODE_ENV: 'production'[m
[32m+[m[32m        NODE_VERSION: v14.17.6[m
[32m+[m[32m        NVM_VERSION: v0.38.0[m
[32m+[m[32m        RACK_ENV: 'production'[m
[32m+[m[32m        RAILS_ENV: 'production'[m
[32m+[m[32m        RAILS_LOG_TO_STDOUT: '1'[m
[32m+[m[32m        RAILS_TMP: '/tmp'[m
[32m+[m
[32m+[m[32m# The 'mounts' describe writable, persistent filesystem mounts in the application.[m
[32m+[m[32mmounts:[m
[32m+[m[32m    "/log":[m
[32m+[m[32m        source: local[m
[32m+[m[32m        source_path: log[m
[32m+[m[32m    "/storage":[m
[32m+[m[32m        source: local[m
[32m+[m[32m        source_path: storage[m
[32m+[m[32m    "/tmp":[m
[32m+[m[32m        source: local[m
[32m+[m[32m        source_path: tmp[m
[32m+[m
[32m+[m[32m# The hooks executed at various points in the lifecycle of the application.[m
[32m+[m[32mhooks:[m
[32m+[m[32m    # The build hook turns what is in source control into the deployable application.[m
[32m+[m[32m    build: |[m
[32m+[m[32m        set -e[m
[32m+[m
[32m+[m[32m        echo "Installing NVM $NVM_VERSION"[m
[32m+[m[32m        unset NPM_CONFIG_PREFIX[m
[32m+[m[32m        export NVM_DIR="$PLATFORM_APP_DIR/.nvm"[m
[32m+[m[32m        # install.sh will automatically install NodeJS based on the presence of $NODE_VERSION[m
[32m+[m[32m        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh | bash[m
[32m+[m[32m        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"[m
[32m+[m
[32m+[m[32m        # we install the bundled bundler version and fallback to a default (in env vars above)[m
[32m+[m[32m        export BUNDLER_VERSION="$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)" || $DEFAULT_BUNDLER_VERSION[m
[32m+[m[32m        echo "Install bundler $BUNDLER_VERSION"[m
[32m+[m[32m        gem install --no-document bundler -v $BUNDLER_VERSION[m
[32m+[m
[32m+[m[32m        echo "Installing gems"[m
[32m+[m[32m        # We copy the bundle directory to the Platform.sh cache directory for[m
[32m+[m[32m        # safe keeping, then restore from there on the next build. That allows[m
[32m+[m[32m        # bundler to skip downloading code it doesn't need to.[m
[32m+[m[32m        [ -d "$PLATFORM_CACHE_DIR/bundle" ] && \[m
[32m+[m[32m          rsync -az --delete "$PLATFORM_CACHE_DIR/bundle/" vendor/bundle/[m
[32m+[m[32m        mkdir -p "$PLATFORM_CACHE_DIR/bundle"[m
[32m+[m[32m        bundle install[m
[32m+[m[32m        # synchronize updated cache for next build[m
[32m+[m[32m        rsync -az --delete vendor/bundle/ "$PLATFORM_CACHE_DIR/bundle/"[m
[32m+[m
[32m+[m[32m        # precompile assets[m
[32m+[m[32m        echo "Precompiling assets"[m
[32m+[m[32m        # We copy the webpacker directory to the Platform.sh cache directory for[m
[32m+[m[32m        # safe keeping, then restore from there on the next build. That allows[m
[32m+[m[32m        # bundler to skip downloading code it doesn't need to.[m
[32m+[m[32m        mkdir -p "$PLATFORM_CACHE_DIR/webpacker"[m
[32m+[m[32m        mkdir -p "$RAILS_TMP/cache/webpacker"[m
[32m+[m[32m        [ -d "$PLATFORM_CACHE_DIR/webpacker" ] && \[m
[32m+[m[32m          rsync -az --delete "$PLATFORM_CACHE_DIR/webpacker/" $RAILS_TMP/cache/webpacker/[m
[32m+[m[32m        # We dont need secret here https://github.com/rails/rails/issues/32947[m
[32m+[m[32m        SECRET_KEY_BASE=1 bundle exec rails assets:precompile[m
[32m+[m[32m        rsync -az --delete $RAILS_TMP/cache/webpacker/ "$PLATFORM_CACHE_DIR/webpacker/"[m
[32m+[m[32m    # The deploy hook runs after your application has been deployed and started.[m
[32m+[m[32m    deploy: |[m
[32m+[m[32m        bundle exec rails db:migrate[m
[32m+[m[32m# The configuration of the application when running.[m
[32m+[m[32mweb:[m
[32m+[m[32m    upstream:[m
[32m+[m[32m        # Send requests to the app server through a unix socket, whose location[m
[32m+[m[32m        # will be defined in an environment variable named SOCKET.[m
[32m+[m[32m        socket_family: "unix"[m
[32m+[m
[32m+[m[32m    commands:[m
[32m+[m[32m        start: 'bundle exec unicorn -l $SOCKET'[m
[1mdiff --git a/.platform/routes.yaml b/.platform/routes.yaml[m
[1mnew file mode 100644[m
[1mindex 0000000..419c84c[m
[1m--- /dev/null[m
[1m+++ b/.platform/routes.yaml[m
[36m@@ -0,0 +1,12 @@[m
[32m+[m[32m# The routes of the project.[m
[32m+[m[32m#[m
[32m+[m[32m# Each route describes how an incoming URL is going[m
[32m+[m[32m# to be processed by Platform.sh.[m
[32m+[m
[32m+[m[32m"https://www.{default}/":[m
[32m+[m[32m    type: upstream[m
[32m+[m[32m    upstream: "lnclassapp:http"[m
[32m+[m
[32m+[m[32m"https://{default}/":[m
[32m+[m[32m    type: redirect[m
[32m+[m[32m    to: "https://www.{default}/"[m
\ No newline at end of file[m
[1mdiff --git a/.platform/services.yaml b/.platform/services.yaml[m
[1mnew file mode 100644[m
[1mindex 0000000..596d740[m
[1m--- /dev/null[m
[1m+++ b/.platform/services.yaml[m
[36m@@ -0,0 +1,8 @@[m
[32m+[m[32m# The services of the project.[m
[32m+[m[32m#[m
[32m+[m[32m# Each service listed will be deployed[m
[32m+[m[32m# to power your Platform.sh project.[m
[32m+[m
[32m+[m[32mdb:[m
[32m+[m[32m    type: postgresql:13[m
[32m+[m[32m    disk: 1024[m
[1mdiff --git a/unicorn.rb b/unicorn.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..ccc3d1a[m
[1m--- /dev/null[m
[1m+++ b/unicorn.rb[m
[36m@@ -0,0 +1,12 @@[m
[32m+[m[32m@dir = "/app/"[m
[32m+[m
[32m+[m[32mworker_processes 2[m
[32m+[m[32mworking_directory @dir[m
[32m+[m
[32m+[m[32mtimeout 30[m
[32m+[m
[32m+[m[32mlisten "unix://#{ENV['SOCKET']}"[m
[32m+[m[32m#listen "/run/app.sock", :backlog => 64[m
[32m+[m
[32m+[m[32m# Set process id path[m
[32m+[m[32mpid "/run/unicorn.pid"[m

[33mcommit cec149bcebbc21154829ecef39d97e3ce8e0216c[m[33m ([m[1;31morigin/main[m[33m)[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 16:50:06 2022 +0000

    Gemfile: fix gemfile

[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex 58085bf..a2cddf6 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -41,15 +41,10 @@[m [mgem 'devise-encryptable', '~> 0.2.0'[m
 #gem 'devise_invitable', '~> 2.0', '>= 2.0.6'[m
 #gem 'devise-i18n', '~> 1.10', '>= 1.10.2'[m
 [m
[31m-<<<<<<< HEAD[m
[31m-=======[m
[31m-[m
 ############### Deploy    ############[m
 gem 'platform_sh_rails'[m
 gem "unicorn", "~> 6.0", :group => :production[m
 [m
[31m-[m
[31m->>>>>>> Develop[m
 # Build JSON APIs with ease [https://github.com/rails/jbuilder][m
 gem "jbuilder"[m
 [m

[33mcommit fa13ba3aef8c9e884e572a59e2b5b2501900d8a6[m
Merge: c2324c4 bc4d667
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 16:28:22 2022 +0000

    add Merge Develop

[33mcommit bc4d667831926b7c7d6002aa8cd82d8b2b400e3b[m[33m ([m[1;31mplatform/Develop[m[33m, [m[1;31morigin/Develop[m[33m, [m[1;32mPlsh-Db-params[m[33m, [m[1;32mDevelop[m[33m)[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 16:23:51 2022 +0000

    plsh gem and DB params

[1mdiff --git a/config/database.yml b/config/database.yml[m
[1mindex 04550b6..467690a 100644[m
[1m--- a/config/database.yml[m
[1m+++ b/config/database.yml[m
[36m@@ -84,7 +84,11 @@[m [mtest:[m
 # for a full overview on how database connection configuration can be specified.[m
 #[m
 production:[m
[31m-  <<: *default[m
[31m-  database: Dev_Lnclassapp_production[m
[31m-  username: Dev_Lnclassapp[m
[31m-  password: <%= ENV["DEV_LNCLASSAPP_DATABASE_PASSWORD"] %>[m
[32m+[m[32m  production:[m
[32m+[m[32m  adapter: postgresql[m
[32m+[m[32m  encoding: unicode[m
[32m+[m[32m  database: <%= ENV['LNCLASSAPP_DATABASE_NAME'] %>[m
[32m+[m[32m  username: <%= ENV['LNCLASSAPP_DATABASE_USERNAME'] %>[m
[32m+[m[32m  password: <%= ENV['LNCLASSAPP_DATABASE_PASSWORD'] %>[m
[32m+[m[32m  host: <%= ENV['LNCLASSAPP_DATABASE_HOST'] %>[m
[32m+[m[32m  port: <%= ENV['LNCLASSAPP_DATABASE_PORT'] %>[m
\ No newline at end of file[m

[33mcommit 842fb2b74921c52dbf96d4d242270d862176588d[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 16:15:31 2022 +0000

    Gemfile: add db params

[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex d897e96..596bf8a 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -42,6 +42,11 @@[m [mgem 'devise-encryptable', '~> 0.2.0'[m
 #gem 'devise-i18n', '~> 1.10', '>= 1.10.2'[m
 [m
 [m
[32m+[m[32m############### Deploy    ############[m
[32m+[m[32mgem 'platform_sh_rails'[m
[32m+[m[32mgem "unicorn", "~> 6.0", :group => :production[m
[32m+[m
[32m+[m
 # Build JSON APIs with ease [https://github.com/rails/jbuilder][m
 gem "jbuilder"[m
 [m
[1mdiff --git a/Gemfile.lock b/Gemfile.lock[m
[1mindex 0edb424..40a84e1 100644[m
[1m--- a/Gemfile.lock[m
[1m+++ b/Gemfile.lock[m
[36m@@ -54,6 +54,8 @@[m [mGEM[m
     activerecord (7.0.2.2)[m
       activemodel (= 7.0.2.2)[m
       activesupport (= 7.0.2.2)[m
[32m+[m[32m    activerecord-nulldb-adapter (0.8.0)[m
[32m+[m[32m      activerecord (>= 5.2.0, < 7.1)[m
     activestorage (7.0.2.2)[m
       actionpack (= 7.0.2.2)[m
       activejob (= 7.0.2.2)[m
[36m@@ -132,6 +134,7 @@[m [mGEM[m
       rails-dom-testing (>= 1, < 3)[m
       railties (>= 4.2.0)[m
       thor (>= 0.14, < 2.0)[m
[32m+[m[32m    kgio (2.11.4)[m
     loofah (2.14.0)[m
       crass (~> 1.0.2)[m
       nokogiri (>= 1.5.9)[m
[36m@@ -164,6 +167,10 @@[m [mGEM[m
       racc (~> 1.4)[m
     orm_adapter (0.5.0)[m
     pg (1.3.3)[m
[32m+[m[32m    platform_sh (0.2.11)[m
[32m+[m[32m    platform_sh_rails (0.1.12)[m
[32m+[m[32m      activerecord-nulldb-adapter[m
[32m+[m[32m      platform_sh (= 0.2.11)[m
     popper_js (2.9.3)[m
     public_suffix (4.0.6)[m
     puma (5.6.2)[m
[36m@@ -198,6 +205,7 @@[m [mGEM[m
       rake (>= 12.2)[m
       thor (~> 1.0)[m
       zeitwerk (~> 2.5)[m
[32m+[m[32m    raindrops (0.20.0)[m
     rake (13.0.6)[m
     redis (4.6.0)[m
     regexp_parser (2.2.1)[m
[36m@@ -242,6 +250,9 @@[m [mGEM[m
       railties (>= 6.0.0)[m
     tzinfo (2.0.4)[m
       concurrent-ruby (~> 1.0)[m
[32m+[m[32m    unicorn (6.1.0)[m
[32m+[m[32m      kgio (~> 2.6)[m
[32m+[m[32m      raindrops (~> 0.7)[m
     warden (1.2.9)[m
       rack (>= 2.0.9)[m
     web-console (4.2.0)[m
[36m@@ -277,6 +288,7 @@[m [mDEPENDENCIES[m
   jbuilder[m
   jquery-rails[m
   pg (~> 1.1)[m
[32m+[m[32m  platform_sh_rails[m
   puma (~> 5.0)[m
   rails (~> 7.0.2, >= 7.0.2.2)[m
   redis (~> 4.0)[m
[36m@@ -287,6 +299,7 @@[m [mDEPENDENCIES[m
   tailwindcss-rails[m
   turbo-rails[m
   tzinfo-data[m
[32m+[m[32m  unicorn (~> 6.0)[m
   web-console[m
   webdrivers[m
 [m

[33mcommit c2324c402030a01b4ef13869b620ad268b6758f6[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 16:08:59 2022 +0000

    add

[1mdiff --git a/Gemfile b/Gemfile[m
[1mindex d897e96..e4914c2 100644[m
[1m--- a/Gemfile[m
[1m+++ b/Gemfile[m
[36m@@ -41,7 +41,6 @@[m [mgem 'devise-encryptable', '~> 0.2.0'[m
 #gem 'devise_invitable', '~> 2.0', '>= 2.0.6'[m
 #gem 'devise-i18n', '~> 1.10', '>= 1.10.2'[m
 [m
[31m-[m
 # Build JSON APIs with ease [https://github.com/rails/jbuilder][m
 gem "jbuilder"[m
 [m

[33mcommit e16aba3159911faa5c73aea555621fe3fe95604d[m[33m ([m[1;31mplatform/HomePage[m[33m, [m[1;31morigin/HomePage[m[33m, [m[1;32mHomePage[m[33m)[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 15:42:36 2022 +0000

    app/views/home/shared/_feeds: add homepage

[1mdiff --git a/app/views/home/shared/_feeds.html.erb b/app/views/home/shared/_feeds.html.erb[m
[1mindex 443102f..38024f1 100644[m
[1m--- a/app/views/home/shared/_feeds.html.erb[m
[1m+++ b/app/views/home/shared/_feeds.html.erb[m
[36m@@ -14,11 +14,23 @@[m
             <% end %>[m
             </div>[m
             <!-- Feed Bar-->[m
[31m-            <div class="flex flex-wrap border-top p-2">[m
[31m-            <div class="flex place-items-center">[m
[31m-                <span class=""> <%= @FeedExercices.where("course_id = ?", c.id).count %> Exercices</span>[m
[31m-                <span class="flex"> Voir Exercices </span>[m
[31m-            </div>[m
[32m+[m[32m            <div class="flex flex-wrap border-top">[m
[32m+[m[32m               <div class="flex place-items-center">[m
[32m+[m[32m                    <div class="flex place-items-end mx-4">[m
[32m+[m[32m                        <div class=" text-sm">[m
[32m+[m[32m                        <% if @FeedExercices.where("course_id = ?", c.id).count == 0 %>[m
[32m+[m[32m                            <p class="">Pas d'exercice</p>[m
[32m+[m[32m                        <% elsif @FeedExercices.where("course_id = ?", c.id).count == 1 %>[m
[32m+[m[32m                            <p class=""> 1 exercice</p>[m
[32m+[m[32m                        <% else %>[m
[32m+[m[32m                            <p class=""> <%= @FeedExercices.where("course_id = ?", c.id).count %> Exercices</p>[m
[32m+[m[32m                        <% end %>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                    <div class="text-sm">[m
[32m+[m[32m                        <p class="">Exercicer</p>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                    </div>[m
[32m+[m[32m                </div>[m
             </div>[m
         </div>[m
         [m
[1mdiff --git a/app/views/home/shared/_feeds_bar.html.erb b/app/views/home/shared/_feeds_bar.html.erb[m
[1mindex 6840114..e69de29 100644[m
[1m--- a/app/views/home/shared/_feeds_bar.html.erb[m
[1m+++ b/app/views/home/shared/_feeds_bar.html.erb[m
[36m@@ -1,4 +0,0 @@[m
[31m-<div class="border-top p-2">[m
[31m-    <span>100 Eleves</span>[m
[31m-    <span>10 Donner</span>[m
[31m-</div>[m
\ No newline at end of file[m

[33mcommit b09caf624ff26cd8cb0916ccb0aaa24a7c83184a[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Tue Mar 22 10:49:45 2022 +0000

    add Add COunt exercise

[1mdiff --git a/app/controllers/materials_controller.rb b/app/controllers/materials_controller.rb[m
[1mindex 90136fd..73d3a8c 100644[m
[1m--- a/app/controllers/materials_controller.rb[m
[1m+++ b/app/controllers/materials_controller.rb[m
[36m@@ -9,6 +9,9 @@[m [mclass MaterialsController < ApplicationController[m
 [m
   # GET /materials/1 or /materials/1.json[m
   def show[m
[32m+[m[32m    @FeedMaterials = Material.all[m
[32m+[m[32m    #@feed_courses = Course.where("level_id = ? and material_id = ?", @current_user.level_id, @material.id).order('created_at desc') and return[m[41m [m
[32m+[m[32m    @FeedCourses = Course.where("material_name = ?", @material.title).order('created_at desc')[m
   end[m
 [m
   # GET /materials/new[m
[1mdiff --git a/app/models/home.rb b/app/models/home.rb[m
[1mindex 5f005d4..dc3e350 100644[m
[1m--- a/app/models/home.rb[m
[1m+++ b/app/models/home.rb[m
[36m@@ -1,10 +1,9 @@[m
 class Home < ApplicationRecord[m
 [m
[31m-    #############  Request Scope ######[m
[31m-    scope :ExerciseOfCourse, -> {where("course_id == ?", c.id).order(created_at: :asc)}[m
[32m+[m[32m#############  Request Scope ######[m
   scope :ready, -> { where("published == false")}[m
   scope :chrono, -> { order(created_at: :desc)}[m
[31m-[m
[32m+[m[32m  scope :[m
   #current user completed exercice[m
     def completed_by(user)[m
         results.any? {|r| r.user == user}[m
[1mdiff --git a/app/views/devise/registrations/new.html.erb b/app/views/devise/registrations/new.html.erb[m
[1mindex 92a15ff..5c48cc6 100644[m
[1m--- a/app/views/devise/registrations/new.html.erb[m
[1m+++ b/app/views/devise/registrations/new.html.erb[m
[36m@@ -1,37 +1,43 @@[m
[31m-<h2>Sign up</h2>[m
[32m+[m[32m<div class="container-fluid ">[m
[32m+[m[32m  <div class="flex flex-wrap ">[m
[32m+[m[32m    <div class="m-auto card p-4 rounded-md">[m
[32m+[m[32m      <h2 class="mt-20">Créer Son Sompte</h2>[m
 [m
[31m-<%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>[m
[31m-  <%= render "devise/shared/error_messages", resource: resource %>[m
[32m+[m[32m        <%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>[m
[32m+[m[32m          <%= render "devise/shared/error_messages", resource: resource %>[m
 [m
[31m-  <br />[m
[31m-  <div class="field">[m
[31m-    <%= f.label :Nom %><br />[m
[31m-    <%= f.text_field :first_name, autofocus: true, autocomplete: "first_name", placeholder:"Prénom ...", class:"" %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :Prénom %><br />[m
[31m-    <%= f.text_field :last_name, placeholder:"Prénom ...", class:"" %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :"N° Matricule" %><br />[m
[31m-    <%= f.phone_field :matricule, placeholder:"N° Matricule ...", class:"" %>[m
[31m-  </div>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :"N° WhatsApp" %><br />[m
[31m-    <%= f.phone_field :contact, placeholder:"N° WhatsApp ...", class:"" %>[m
[31m-  </div>[m
[31m-<%= f.hidden_field :role, value:"Student" %>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :password %>[m
[31m-    <% if @minimum_password_length %>[m
[31m-    <em>(<%= @minimum_password_length %> characters minimum)</em>[m
[31m-    <% end %><br />[m
[31m-    <%= f.password_field :password, autocomplete: "new-password" %>[m
[31m-  </div>[m
[32m+[m[32m          <br />[m
[32m+[m[32m          <div class="field ">[m
[32m+[m[32m            <%= f.label :Nom %><br />[m
[32m+[m[32m            <%= f.text_field :first_name, autofocus: true, autocomplete: "first_name", placeholder:"Prénom ...", class:"" %>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <div class="field my-4">[m
[32m+[m[32m            <%= f.label :Prénom %><br />[m
[32m+[m[32m            <%= f.text_field :last_name, placeholder:"Prénom ...", class:"" %>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <div class="field">[m
[32m+[m[32m            <%= f.label :"N° Matricule" %><br />[m
[32m+[m[32m            <%= f.phone_field :matricule, placeholder:"N° Matricule ...", class:"" %>[m
[32m+[m[32m          </div>[m
[32m+[m[32m          <div class="field my-4 ">[m
[32m+[m[32m            <%= f.label :"N° WhatsApp" %><br />[m
[32m+[m[32m            <%= f.phone_field :contact, placeholder:"N° WhatsApp ...", class:"" %>[m
[32m+[m[32m          </div>[m
[32m+[m[32m        <%= f.hidden_field :role, value:"Student" %>[m
[32m+[m[32m         <div class="field>[m
[32m+[m[32m         <%= f.label :"Tu es dans quelle ville?" %> <br>[m
[32m+[m[32m         <%= f.text_field :city_name, class:"", placeholder:"Nom de la ville ..." %>[m
[32m+[m[32m         </div>[m
[32m+[m[32m         <div class="field my-4">[m
[32m+[m[32m          <%= f.label :"Termanale ..." %> <br>[m
[32m+[m[32m         <%= f.select :level_name, @levels.map{|level| [level.title]}, class:"", placeholder:"Quelle Tle ? ..." %>[m
[32m+[m[32m         </div>[m
 [m
[31m-  <div class="actions">[m
[31m-    <%= f.submit "S'INSCRIRE", class:"btn btn-primary p-2 border rounded-md mt-2" %>[m
[32m+[m[32m          <div class="actions my-2">[m
[32m+[m[32m            <%= f.submit "S'INSCRIRE", class:"btn btn-primary p-2 border rounded-md mt-2" %>[m
[32m+[m[32m          </div>[m
[32m+[m[32m        <% end %>[m
[32m+[m[32m          </div>[m
[32m+[m[32m    </div>[m
   </div>[m
[31m-<% end %>[m
 [m
[31m-<%= render "devise/shared/links" %>[m
[1mdiff --git a/app/views/devise/sessions/new.html.erb b/app/views/devise/sessions/new.html.erb[m
[1mindex ee2e80b..dcab5a8 100644[m
[1m--- a/app/views/devise/sessions/new.html.erb[m
[1m+++ b/app/views/devise/sessions/new.html.erb[m
[36m@@ -1,26 +1,30 @@[m
[31m-<h2>Log in</h2>[m
[32m+[m[32m<div class="container-fluid ">[m
[32m+[m[32m  <div class="flex flex-wrap ">[m
[32m+[m[32m  <div class="m-auto card p-4 rounded-md">[m
[32m+[m[32m  <h2 class="mt-20">Se Connecter</h2>[m
 [m
[31m-<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>[m
[31m-  <div class="field">[m
[31m-    <%= f.label :matricule %><br />[m
[31m-    <%= f.text_field :logged, autofocus: true, autocomplete: "matricule" %>[m
[31m-  </div>[m
[32m+[m[32m  <%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>[m
[32m+[m[32m    <div class="field">[m
[32m+[m[32m      <%= f.label :matricule %><br />[m
[32m+[m[32m      <%= f.text_field :logged, autofocus: true, autocomplete: "matricule", placeholder:"N° Matricule" %>[m
[32m+[m[32m    </div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password %><br />[m
[31m-    <%= f.password_field :password, autocomplete: "current-password" %>[m
[31m-  </div>[m
[32m+[m[32m    <div class="field my-4">[m
[32m+[m[32m      <%= f.label :"N° WhatsApp" %><br />[m
[32m+[m[32m      <%= f.password_field :password, autocomplete: "current-password", placeholder:"N° WhatsApp" %>[m
[32m+[m[32m    </div>[m
 [m
[31m-  <% if devise_mapping.rememberable? %>[m
[31m-    <div class="field">[m
[31m-      <%= f.check_box :remember_me %>[m
[31m-      <%= f.label :remember_me %>[m
[32m+[m[32m    <% if devise_mapping.rememberable? %>[m
[32m+[m[32m      <div class="field my-2">[m
[32m+[m[32m        <%= f.check_box :remember_me %>[m
[32m+[m[32m        <%= f.label :"Toujours connecter" %>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    <% end %>[m
[32m+[m
[32m+[m[32m    <div class="actions mb-4">[m
[32m+[m[32m      <%= f.submit "Se connecter", class:"btn btn-primary p-2 border rounded-md mt-2" %>[m
     </div>[m
   <% end %>[m
[31m-[m
[31m-  <div class="actions">[m
[31m-    <%= f.submit "Log in", class:"btn btn-primary p-2 border rounded-md mt-2" %>[m
   </div>[m
[31m-<% end %>[m
[31m-[m
[31m-<%= render "devise/shared/links" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</div>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/devise/shared/_links.html.erb b/app/views/devise/shared/_links.html.erb[m
[1mindex 9d6fd6e..b383ee6 100644[m
[1m--- a/app/views/devise/shared/_links.html.erb[m
[1m+++ b/app/views/devise/shared/_links.html.erb[m
[36m@@ -1,25 +1,27 @@[m
 <%- if controller_name != 'sessions' %>[m
[31m-  <%= link_to "Log in", new_session_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "Se connecter a son compte", new_session_path(resource_name) %><br />[m
 <% end %>[m
 [m
 <%- if devise_mapping.registerable? && controller_name != 'registrations' %>[m
[31m-  <%= link_to "Sign up", new_registration_path(resource_name), class:"font-bold" %><br />[m
[32m+[m
[32m+[m[32m<p class="small"> Ou si tu n'as pas créé de compte</p>[m
[32m+[m[32m  <%= link_to "Créez votre Compte", new_registration_path(resource_name), class:"font-semibold" %><br />[m
 <% end %>[m
 [m
 <%- if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations' %>[m
[31m-  <%= link_to "Forgot your password?", new_password_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "N° whatsapp oublié ?", new_password_path(resource_name) %><br />[m
 <% end %>[m
 [m
 <%- if devise_mapping.confirmable? && controller_name != 'confirmations' %>[m
[31m-  <%= link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "Vous avez pas réçu les instructions de confirmation?", new_confirmation_path(resource_name) %><br />[m
 <% end %>[m
 [m
 <%- if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks' %>[m
[31m-  <%= link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name) %><br />[m
[32m+[m[32m  <%= link_to "Vous avez pas réçu les instructions pour débloquer?", new_unlock_path(resource_name) %><br />[m
 <% end %>[m
 [m
 <%- if devise_mapping.omniauthable? %>[m
   <%- resource_class.omniauth_providers.each do |provider| %>[m
[31m-    <%= link_to "Sign in with #{OmniAuth::Utils.camelize(provider)}", omniauth_authorize_path(resource_name, provider), method: :post %><br />[m
[32m+[m[32m    <%= link_to "Créer son compte avec #{OmniAuth::Utils.camelize(provider)}", omniauth_authorize_path(resource_name, provider), method: :post %><br />[m
   <% end %>[m
 <% end %>[m
[1mdiff --git a/app/views/home/index.html.erb b/app/views/home/index.html.erb[m
[1mindex f169902..a08486a 100644[m
[1m--- a/app/views/home/index.html.erb[m
[1m+++ b/app/views/home/index.html.erb[m
[36m@@ -2,8 +2,8 @@[m
 <% @title="Léçons" %>[m
 [m
 <%= render "home/shared/navbar" %> [m
[31m-<main class="container mt-24">[m
[31m-  <div class="row align-items-md-stretch bg-light rounded-3">[m
[32m+[m[32m<main class="container-fluid mt-24">[m
[32m+[m[32m  <div class="row align-items-md-stretch rounded-3">[m
     <!-- main feed -->[m
     <div class="col-md-3 py-5">[m
     <!-- feed material -->[m
[1mdiff --git a/app/views/home/shared/_feeds.html.erb b/app/views/home/shared/_feeds.html.erb[m
[1mindex 9b67a4d..443102f 100644[m
[1m--- a/app/views/home/shared/_feeds.html.erb[m
[1m+++ b/app/views/home/shared/_feeds.html.erb[m
[36m@@ -1,7 +1,9 @@[m
 <% @FeedCourses.each do |c| %>[m
     <div class="bg-white border p-2 rounded-md mb-2">[m
[31m-        <h2 class="font-bold" >[m
[31m-            <%= c.title %>[m
[32m+[m[32m        <h2 class="font-semibold " >[m
[32m+[m[32m            <p class="text-xl">[m
[32m+[m[32m                <%= c.title %>[m
[32m+[m[32m            </p>[m
         </h2>[m
         <!-- Courses-->[m
         <div class="border rounded-md mt-2">[m
[36m@@ -12,19 +14,13 @@[m
             <% end %>[m
             </div>[m
             <!-- Feed Bar-->[m
[31m-            <%= render "home/shared/feeds_bar" %>[m
[31m-        </div>[m
[31m-        <!-- Exercises -->[m
[31m-        <div class="border rounded-md mt-2">[m
[31m-            <div class="p-2">[m
[31m-            <p class="font-bold text-md "> Commencez les exercices</p>[m
[31m-               [m
[32m+[m[32m            <div class="flex flex-wrap border-top p-2">[m
[32m+[m[32m            <div class="flex place-items-center">[m
[32m+[m[32m                <span class=""> <%= @FeedExercices.where("course_id = ?", c.id).count %> Exercices</span>[m
[32m+[m[32m                <span class="flex"> Voir Exercices </span>[m
             </div>[m
[31m-            <!-- Exercise Bar -->[m
[31m-            <div class="border-top flex items-center p-2">[m
[31m-                <span>500 Eleves</span>[m
[31m-                <span> Traiter</span>[m
             </div>[m
         </div>[m
[32m+[m[41m        [m
     </div>[m
 <% end %> [m
\ No newline at end of file[m
[1mdiff --git a/app/views/home/shared/_materials.html.erb b/app/views/home/shared/_materials.html.erb[m
[1mindex c99cf16..d052ffa 100644[m
[1m--- a/app/views/home/shared/_materials.html.erb[m
[1m+++ b/app/views/home/shared/_materials.html.erb[m
[36m@@ -1,5 +1,5 @@[m
 <div class="container-fluid">[m
     <% @FeedMaterials.each do |material| %>[m
[31m-        <p class="col-md-8 font-semibold"><%= material.title %></p>[m
[32m+[m[32m        <p><%= link_to material.title, material , class:" no-underline font-semibold text-black" %></p>[m
     <% end %>[m
 </div>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/home/shared/_terms.html.erb b/app/views/home/shared/_terms.html.erb[m
[1mindex 3e36b6f..99674d9 100644[m
[1m--- a/app/views/home/shared/_terms.html.erb[m
[1m+++ b/app/views/home/shared/_terms.html.erb[m
[36m@@ -1,4 +1,4 @@[m
[31m-<p class=" md:block lg:block mt-4 text-sm">[m
[32m+[m[32m<p class="hidden md:block lg:block mt-4 text-sm">[m
    A propos .[m
    condition générale d'utilisation - Traitement des Données[m
 </p>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/materials/show.html.erb b/app/views/materials/show.html.erb[m
[1mindex 7d6996d..d12f9ec 100644[m
[1m--- a/app/views/materials/show.html.erb[m
[1m+++ b/app/views/materials/show.html.erb[m
[36m@@ -1,15 +1,18 @@[m
[31m-<div class="mx-auto md:w-2/3 w-full flex">[m
[31m-  <div class="mx-auto">[m
[31m-    <% if notice.present? %>[m
[31m-      <p class="py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block" id="notice"><%= notice %></p>[m
[31m-    <% end %>[m
[32m+[m[32m<%= render "home/shared/navbar" %>[m[41m [m
 [m
[31m-    <%= render @material %>[m
 [m
[31m-    <%= link_to 'Edit this material', edit_material_path(@material), class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
[31m-    <div class="inline-block ml-2">[m
[31m-      <%= button_to 'Destroy this material', material_path(@material), method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>[m
[32m+[m[32m<div class="grid grid-cols-1 mt-12 lg:mt-24 lg:grid-cols-4 lg:gap-3">[m
[32m+[m[32m  <!-- sidebar-->[m
[32m+[m[32m  <div class="lg:ml-28 col-span-1 ">[m
[32m+[m[32m    <div class="place-items-center">[m
[32m+[m[32m      <%= render "home/shared/materials" %>[m
     </div>[m
[31m-    <%= link_to 'Back to materials', materials_path, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
[32m+[m[32m      <%= render "home/shared/terms" %>[m
   </div>[m
[31m-</div>[m
[32m+[m[32m  <!-- feed content-->[m
[32m+[m[32m  <div class="col-span-2">[m
[32m+[m[32m    <div class="place-items-center">[m
[32m+[m[32m      <%= render "home/shared/feeds" %>[m
[32m+[m[32m    </div>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</div>[m
\ No newline at end of file[m

[33mcommit c02d8d1d208e08ffe6f5652d8ff64a7b9b76aa2a[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Sun Mar 20 16:25:03 2022 +0000

    app/views: add grade

[1mdiff --git a/app/views/courses/shared/_completed_exercices.html.erb b/app/views/courses/shared/_completed_exercices.html.erb[m
[1mindex 01d213f..ac7326b 100644[m
[1m--- a/app/views/courses/shared/_completed_exercices.html.erb[m
[1m+++ b/app/views/courses/shared/_completed_exercices.html.erb[m
[36m@@ -1,7 +1,11 @@[m
[31m-<section class="quiz-block completed">[m
[31m-    <div class="block-heading">[m
[31m-        <h3><%= q.name%></h3>[m
[32m+[m[32m<div class="card rounded-md">[m
[32m+[m[32m    <div class="mb-2 font-semibold bg-gray-100">[m
[32m+[m[32m    <header class=""><%= q.name %></header>[m
     </div>[m
[31m-    <p>Grade: <%= q.user_grade(current_user) %></p>[m
[31m-    <!--  link_to "+Note", notes_quiz_path(q.id)    -->[m
[31m-</section>[m
\ No newline at end of file[m
[32m+[m[32m    <div class="flex place-items-center">[m
[32m+[m[32m        <p class="mx-2">Taux: <%= q.user_grade(current_user) %></p>[m
[32m+[m[41m        [m
[32m+[m[32m        <%= link_to "Reprend", new_exercice_result_path(q), class: "text-black"%>[m
[32m+[m[32m    </div>[m
[32m+[m[41m        [m
[32m+[m[32m</div>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/results/_form.html.erb b/app/views/results/_form.html.erb[m
[1mindex 6de1699..6e09cd9 100644[m
[1m--- a/app/views/results/_form.html.erb[m
[1m+++ b/app/views/results/_form.html.erb[m
[36m@@ -1,52 +1,22 @@[m
[31m-<%= form_with(model: result, class: "contents") do |form| %>[m
[31m-  <% if result.errors.any? %>[m
[31m-    <div id="error_explanation" class="bg-red-50 text-red-500 px-3 py-2 font-medium rounded-lg mt-3">[m
[31m-      <h2><%= pluralize(result.errors.count, "error") %> prohibited this result from being saved:</h2>[m
 [m
[31m-      <ul>[m
[31m-        <% result.errors.each do |error| %>[m
[31m-          <li><%= error.full_message %></li>[m
[31m-        <% end %>[m
[31m-      </ul>[m
[31m-    </div>[m
[31m-  <% end %>[m
[31m-[m
[31m-  <div class="my-5">[m
[31m-    <%= form.label :user_id %>[m
[31m-    <%= form.text_field :user_id, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>[m
[31m-  </div>[m
[31m-[m
[31m-  <div class="my-5">[m
[31m-    <%= form.label :exercice_id %>[m
[31m-    <%= form.text_field :exercice_id, class: "block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>[m
[31m-  </div>[m
[31m-[m
[31m-  <div class="inline">[m
[31m-    <%= form.submit class: "rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer" %>[m
[31m-  </div>[m
[31m-<% end %>[m
[31m-[m
[31m-[m
[31m-<%= form_for @result, url: exercice_results_path(@result.exercice) do |f| %>[m
[32m+[m[32m  <%= form_for @result, url: exercice_results_path(@result.exercice) do |f| %>[m
[32m+[m[32m    <div class="card">[m
         <%= render 'shared/validation_errors', :record => @result %>[m
         <%= f.hidden_field :exercice_id %>[m
         <ol>[m
[31m-            <%= f.fields_for :answered_questions do |aq| %>[m
[31m-                <div class="question">[m
[31m-                    <li>[m
[31m-                        <%= aq.hidden_field :question_id %>[m
[31m-                        <p><%= aq.object.question.content %></p>[m
[31m-                        <%= aq.collection_radio_buttons( :answer_id, aq.object.question.answers, :id, :content) do |b| %>[m
[31m-                            <div class="border rounded-md p-2">[m
[31m-                                <%= b.radio_button %>[m
[31m-                                <%= b.label %>[m
[31m-                            </div>[m
[31m-                        <% end %>[m
[31m-                    </li>[m
[32m+[m[32m          <%= f.fields_for :answered_questions do |aq| %>[m
[32m+[m[32m            <li>[m
[32m+[m[32m              <%= aq.hidden_field :question_id %>[m
[32m+[m[32m              <p><%= aq.object.question.content %></p>[m
[32m+[m[32m              <%= aq.collection_radio_buttons( :answer_id, aq.object.question.answers, :id, :content) do |b| %>[m
[32m+[m[32m                <div class="border rounded-md p-2 my-2">[m
[32m+[m[32m                  <%= b.radio_button %>[m
[32m+[m[32m                  <%= b.label %>[m
                 </div>[m
[31m-            <% end %>[m
[32m+[m[32m              <% end %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m          <% end %>[m
         </ol>[m
[31m-[m
[31m-        <%= f.submit "Valide", class:"rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer" %>[m
[31m-[m
[31m-    <% end %>[m
\ No newline at end of file[m
[32m+[m[32m        <%= f.submit "Je vérifie", class:"rounded-md p-2 bg-blue-400 text-white font-semibold mb-10" %>[m
[32m+[m[32m    </div>[m
[32m+[m[32m  <% end %>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/results/new.html.erb b/app/views/results/new.html.erb[m
[1mindex 85e87fe..ff6cbfc 100644[m
[1m--- a/app/views/results/new.html.erb[m
[1m+++ b/app/views/results/new.html.erb[m
[36m@@ -1,8 +1,6 @@[m
 <div class="mx-auto">[m
  <div class="">[m
[31m-    <h1><%= @result.exercice.name %></h1>[m
[32m+[m[32m    <p><%= @result.exercice.name %></p>[m
     <%= render "form", result: @result %>[m
 </div>[m
[31m-[m
[31m-[m
 </div>[m

[33mcommit f36ea54f18e1a16dadc694a04b095eaa4966f577[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Sun Mar 20 15:37:02 2022 +0000

    add Home page and dashboard

[1mdiff --git a/app/controllers/courses_controller.rb b/app/controllers/courses_controller.rb[m
[1mindex 60d8294..663d777 100644[m
[1m--- a/app/controllers/courses_controller.rb[m
[1m+++ b/app/controllers/courses_controller.rb[m
[36m@@ -2,12 +2,13 @@[m [mclass CoursesController < ApplicationController[m
  [m
   before_action :authenticate_user![m
   before_action :set_course, only: %i[ show edit update destroy ][m
[31m-  before_action :find_levels[m
[31m-  before_action :find_materials[m
[32m+[m[41m  [m
[32m+[m[32m  before_action :find_levels, :find_materials[m
[32m+[m[41m  [m
 [m
   # GET /courses or /courses.json[m
   def index[m
[31m-    @courses = Course.all[m
[32m+[m[32m    @courses = Course.all.order("created_at desc")[m
   end[m
 [m
   # GET /courses/1 or /courses/1.json[m
[36m@@ -30,7 +31,7 @@[m [mclass CoursesController < ApplicationController[m
     respond_to do |format|[m
       if @course.save[m
         [m
[31m-        format.html { redirect_to "/course-list", notice: "Course was successfully created." }[m
[32m+[m[32m        format.html { redirect_to "/courses-show", notice: "Course was successfully created." }[m
         format.json { render :show, status: :created, location: @course }[m
       else[m
         format.html { render :new, status: :unprocessable_entity }[m
[1mdiff --git a/app/controllers/dashboard_controller.rb b/app/controllers/dashboard_controller.rb[m
[1mindex 84c17b7..92a2f8b 100644[m
[1m--- a/app/controllers/dashboard_controller.rb[m
[1m+++ b/app/controllers/dashboard_controller.rb[m
[36m@@ -1,6 +1,6 @@[m
 class DashboardController < ApplicationController[m
   before_action :authenticate_user![m
[31m-[m
[32m+[m[41m [m
   #Admin dashboard[m
   def index[m
   end[m
[36m@@ -10,4 +10,6 @@[m [mclass DashboardController < ApplicationController[m
     @LevelList = Level.all.order('created_at desc')[m
     @MaterialList = Material.all.order('created_at desc')[m
   end[m
[32m+[m
[32m+[m[41m  [m
 end[m
[1mdiff --git a/app/validators/classroom_validator.rb b/app/validators/classroom_validator.rb[m
[1mindex 9d24757..1617143 100755[m
[1m--- a/app/validators/classroom_validator.rb[m
[1m+++ b/app/validators/classroom_validator.rb[m
[36m@@ -1,7 +1,7 @@[m
 class ClassroomValidator < ActiveModel::Validator[m
[31m-    def validate(record)[m
[32m+[m[32m    #def validate(record)[m
         #if record.teacher.taught_classes.count {|g| g.name == record.name} > 0[m
         #    record.errors[:group] << "You already have a #{record.name} class"[m
         #end[m
[31m-    end  [m
[32m+[m[32m    #end[m[41m  [m
 end[m
\ No newline at end of file[m
[1mdiff --git a/app/validators/exercice_validator.rb b/app/validators/exercice_validator.rb[m
[1mindex 90cdf99..3c362f2 100755[m
[1m--- a/app/validators/exercice_validator.rb[m
[1m+++ b/app/validators/exercice_validator.rb[m
[36m@@ -1,7 +1,7 @@[m
 class ExerciceValidator < ActiveModel::Validator[m
     def validate(record)[m
         unless record.course.exercices.none? {|q| q.name == record.name}[m
[31m-         record.errors[:exercice] << "Exercice existe déja sur la plateforme, mais vous pouvez changer de nom pour votre classe #{record.classroom.name}"[m
[32m+[m[32m         record.errors[:exercice] << "Exercice existe déja sur la plateforme, mais vous pouvez changer de titre"[m
         end[m
     end[m
 end[m
[1mdiff --git a/app/validators/question_validator.rb b/app/validators/question_validator.rb[m
[1mindex 25c7f5e..8a0de83 100755[m
[1m--- a/app/validators/question_validator.rb[m
[1m+++ b/app/validators/question_validator.rb[m
[36m@@ -17,11 +17,11 @@[m [mclass QuestionValidator < ActiveModel::Validator[m
 [m
         # answers must be unique[m
         if !!record.answers.collect {|a| a.content}.uniq![m
[31m-            record.errors[:question] << "A question cannot have duplicate answers."[m
[32m+[m[32m            record.errors[:question] << "Cette reponse existe déja."[m
         end[m
         # question is unique for a given exrcice[m
         if record.exercice.questions.any? {|q| q.content == record.content }[m
[31m-            record.errors[:question] << "This question has already been added to this quiz."[m
[32m+[m[32m            record.errors[:question] << "Cette question existe déja."[m
         end[m
 [m
         #je voudrais verifier la presence d'une explication[m
[1mdiff --git a/app/views/courses/_course.html.erb b/app/views/courses/_course.html.erb[m
[1mindex 25e102d..5b1f62e 100644[m
[1m--- a/app/views/courses/_course.html.erb[m
[1m+++ b/app/views/courses/_course.html.erb[m
[36m@@ -1,23 +1,27 @@[m
[31m-<div id="<%= dom_id course %>" class="border rounded-md p-2 bg-white">[m
[31m-  <p class="my-5 font-semibold ">[m
[32m+[m[32m<div id="<%= dom_id course %>">[m
[32m+[m[32m<!-- course title-->[m
[32m+[m[32m  <div class=" my-5 font-semibold ">[m
     <%= course.title %>[m
[31m-  </p>[m
[32m+[m[32m  </div>[m
 [m
[31m-  <p class="my-5 ">[m
[32m+[m[32m  <div class="border rounded-md p-2 bg-white mb-5">[m
[32m+[m[32m  <!-- course content-->[m
     <%= course.content %>[m
[31m-  </p>[m
[31m-[m
[32m+[m[41m  [m
[32m+[m[32m  </div>[m
[32m+[m[32m<!-- render exercices-->[m
   <!-- Add exercices list for medium--->[m
[31m-    <div class="card mt-2 md:w-2/3">[m
[32m+[m[32m    <div class="card mt-2">[m
       <div class="m-2">[m
[31m-      <p class="font-bold text-md "> Commencez les exercices</p>[m
[31m-      <%= render partial: "courses/shared/exercices",locals: {course: @course} %>[m
[32m+[m[32m      <p class="font-bold text-md "> Exercices</p>[m
[32m+[m[32m      <%= render partial: "courses/shared/exercices", locals: {course: @course} %>[m
     </div>[m
[32m+[m
[32m+[m[41m  [m
     [m
   <% if action_name != "show" %>[m
     <%= link_to "Show this course", course, class: "rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
     <%= link_to 'Edit this course', edit_course_path(course), class: "rounded-lg py-3 ml-2 px-5 bg-gray-100 inline-block font-medium" %>[m
[31m-    <%= link_to 'Add Exercise', new_course_exercice_path(course), class: "rounded-lg py-3 ml-2 px-5 bg-gray-100 inline-block font-medium" %>[m
[31m-    <hr class="mt-6">[m
[32m+[m[41m    [m
   <% end %>[m
 </div>[m
[1mdiff --git a/app/views/courses/_form.html.erb b/app/views/courses/_form.html.erb[m
[1mindex a1c5663..8008340 100644[m
[1m--- a/app/views/courses/_form.html.erb[m
[1m+++ b/app/views/courses/_form.html.erb[m
[36m@@ -12,36 +12,36 @@[m
   <% end %>[m
 [m
   <div class="my-5">[m
[31m-    <%= f.text_field :title, label:"Titre ...", class: "ln--field" , placeholder:"titre ..." %>[m
[32m+[m[32m    <%= f.text_field :title, label:"Titre ...", class: "ln--field" , placeholder:"Le titre ..." %>[m
   </div>[m
 [m
   <div class="my-5">[m
     [m
[31m-    <%= f.rich_text_area :content, label: "Contenu cours ..." , placeholder:"Corps de la léçon ...", class: "block rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>[m
[32m+[m[32m    <%= f.rich_text_area :content, label: "Contenu de la léçon ..." , placeholder:"Corps de la léçon ...", class: "block rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full" %>[m
   </div>[m
 [m
 <div class="flex mt-2">[m
[31m-  <div class="flex w-1/2 ">[m
[31m-    <div class="flex select w-1/2 ">[m
[32m+[m[32m  <div class="flex w-1/3 ">[m
[32m+[m[32m    <div class="flex select">[m
        <%= f.select :level_name, @levels.map{|level| [level.title]}, label:"Niveau ...", class:" border-red-400 rounded py-2 px-3",[m
         placeholder:"Série" %>[m
     </div>[m
     [m
   </div>[m
[31m-  <div class="flex w-1/2  ml-2">[m
[31m-    <div class="flex select w-1/2 ">[m
[32m+[m[32m  <div class="flex w-1/3 ">[m
[32m+[m[32m    <div class="flex select ">[m
        <%= f.select :material_name, @materials.map{|material| [material.title]}, label:"Matieres ...", class:" border-red-400 rounded py-2 px-3",[m
         placeholder:"Série" %>[m
     </div>[m
   </div>[m
[31m-</div>[m
[31m-[m
[31m-[m
[31m-  <div class="my-5">[m
[31m-    <%= f.check_box :published, class: "block mt-2 h-5 w-5", label:"Publié le cours ..." %>[m
[32m+[m[32m  <div class="flex w-1/3  ml-2">[m
[32m+[m[32m    <div class="flex ">[m
[32m+[m[32m      <%= f.check_box :published, class: "block mt-2", label:"Publié la Léçon" %>[m
[32m+[m[32m    </div>[m
   </div>[m
[32m+[m[32m</div>[m
 [m
   <div class="inline">[m
[31m-    <%= f.submit "Crée Cours", class: "rounded-md py-2 px-3 bg-blue-600 text-white inline-block font-medium cursor-pointer" %>[m
[32m+[m[32m    <%= f.submit "Créer la Léçon", class: "rounded-md py-2 px-3 bg-blue-600 text-white inline-block font-medium cursor-pointer" %>[m
   </div>[m
 <% end %>[m
[1mdiff --git a/app/views/courses/new.html.erb b/app/views/courses/new.html.erb[m
[1mindex 1739653..b44ffd2 100644[m
[1m--- a/app/views/courses/new.html.erb[m
[1m+++ b/app/views/courses/new.html.erb[m
[36m@@ -2,10 +2,9 @@[m
 [m
 <div class="mx-auto md:w-2/3 w-full">[m
   <h1 class="font-bold text-4xl">Nouvelle léçon</h1>[m
[31m-[m
[31m-  <%= render "form", course: @course %>[m
[31m-[m
[31m-  <%= link_to 'Back to courses', courses_path, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
[32m+[m[32m  <div class="border rounded-md p-4 border-bg-blue-600 bg-white">[m
[32m+[m[32m    <%= render "form", course: @course %>[m
[32m+[m[32m  </div>[m
 </div>[m
 [m
 [m
[1mdiff --git a/app/views/courses/show.html.erb b/app/views/courses/show.html.erb[m
[1mindex 9a176a3..aa95c9d 100644[m
[1m--- a/app/views/courses/show.html.erb[m
[1m+++ b/app/views/courses/show.html.erb[m
[36m@@ -6,13 +6,11 @@[m
 [m
     <%= render @course %>[m
 [m
[31m-    <%= link_to 'Edit this course', edit_course_path(@course), class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
[32m+[m[32m    <%= link_to 'Edite léçon', edit_course_path(@course), class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
[32m+[m[32m    <%= link_to 'Exercices', new_course_exercice_path(@course), class:"mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>[m[41m [m
     <div class="inline-block ml-2">[m
[31m-      <%= button_to 'Destroy this course', course_path(@course), method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>[m
[32m+[m[32m      <%= button_to 'Supprimer', course_path(@course), method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>[m
     </div>[m
[31m-    <h2 class="font-semibold text-xl m-2 mt-20">[m
[31m-      <% if currentUserRole?(current_user) === ":teacher?" %> - <%= link_to 'Exercices', new_course_exercice_path(@course) %><% end %>[m
[31m-    </h2>[m
[31m-    <%= link_to 'Back to courses', courses_path, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
[32m+[m[41m    [m
   </div>[m
 </div>[m
[1mdiff --git a/app/views/dashboard/shared/_sidebar.html.erb b/app/views/dashboard/shared/_sidebar.html.erb[m
[1mindex f779925..bb7d5bd 100644[m
[1m--- a/app/views/dashboard/shared/_sidebar.html.erb[m
[1m+++ b/app/views/dashboard/shared/_sidebar.html.erb[m
[36m@@ -18,7 +18,7 @@[m
             <span class="mx-3">Dashboard</span>[m
         <% end %>[m
     [m
[31m-        <%= link_to "course-list", class:"flex items-center mt-4 py-2 px-6 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" do %>[m
[32m+[m[32m        <%= link_to "courses-show", class:"flex items-center mt-4 py-2 px-6 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" do %>[m
             <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"[m
                 stroke="currentColor">[m
                 <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"[m
[1mdiff --git a/app/views/questions/_form.html.erb b/app/views/questions/_form.html.erb[m
[1mindex 2f2b26f..cf3645a 100644[m
[1m--- a/app/views/questions/_form.html.erb[m
[1m+++ b/app/views/questions/_form.html.erb[m
[36m@@ -29,7 +29,7 @@[m
 <div class="col-md-6 py-5">[m
 <!-- feed course -->[m
     <div class="questions-column mt-8">[m
[31m-        <%= link_to "Rendre public!", publish_exercice_path(@exercice), class: "no-underline bg-blue-200 font-semibold rounded-md mb-2 p-2" %>[m
[32m+[m[41m       [m
         <% if @exercice.questions.any? %>[m
             <div class="my-2">[m
                 <%= render 'added_questions', record: @exercice %>[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 92965fc..5fa9407 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -4,6 +4,7 @@[m [mRails.application.routes.draw do[m
   get "feeds", to:'home#index'[m
   [m
   #Course[m
[32m+[m[32m  get "courses-show", to:"courses#show"[m
   get "course-list", to:"courses#index"[m
   get "lesson", to:"courses#new"[m
   [m
[36m@@ -29,7 +30,7 @@[m [mRails.application.routes.draw do[m
   end[m
   [m
   [m
[31m-  resources :courses, except: %i[index new][m
[32m+[m[32m  resources :courses, except: %i[index new ][m
   resources :answers, [m
             :questions,[m
             :results,[m

[33mcommit 26472e669f2da624bf6a98dec15a758a76b88ad3[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Sun Mar 20 12:24:00 2022 +0000

    add redirect to feeds if User sign in

[1mdiff --git a/app/controllers/welcome_controller.rb b/app/controllers/welcome_controller.rb[m
[1mindex fa080c5..f0bb26f 100644[m
[1m--- a/app/controllers/welcome_controller.rb[m
[1m+++ b/app/controllers/welcome_controller.rb[m
[36m@@ -1,17 +1,7 @@[m
 class WelcomeController < ApplicationController[m
[31m-  before_action :current_user_auhenticate?, only: %i[index][m
[31m-[m
[32m+[m[41m  [m
   def index[m
[32m+[m[32m    redirect_to feeds_path if user_signed_in?[m
   end[m
   [m
[31m-  private[m
[31m-    #redirect current_user to feed if signed[m
[31m-    def current_user_auhenticate?[m
[31m-      if :user_signed_in?[m
[31m-        feeds_path[m
[31m-      else[m
[31m-        root_path[m
[31m-      end[m
[31m-   end[m
[31m-  [m
 end[m
[1mdiff --git a/app/views/dashboard/shared/_sidebar.html.erb b/app/views/dashboard/shared/_sidebar.html.erb[m
[1mindex afd1a3f..f779925 100644[m
[1m--- a/app/views/dashboard/shared/_sidebar.html.erb[m
[1m+++ b/app/views/dashboard/shared/_sidebar.html.erb[m
[36m@@ -6,7 +6,7 @@[m
     </div>[m
     [m
     <nav class="mt-10">[m
[31m-        <a class="flex items-center mt-4 py-2 px-6 bg-gray-700 bg-opacity-25 text-gray-100" href="/#">[m
[32m+[m[32m        <%= link_to root_path, class:"flex items-center mt-4 py-2 px-6 bg-gray-700 bg-opacity-25 text-gray-100" do %>[m
             <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"[m
                 stroke="currentColor">[m
                 <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"[m
[36m@@ -16,7 +16,7 @@[m
             </svg>[m
     [m
             <span class="mx-3">Dashboard</span>[m
[31m-        </a>[m
[32m+[m[32m        <% end %>[m
     [m
         <%= link_to "course-list", class:"flex items-center mt-4 py-2 px-6 text-gray-500 hover:bg-gray-700 hover:bg-opacity-25 hover:text-gray-100" do %>[m
             <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"[m
[1mdiff --git a/app/views/home/index.html.erb b/app/views/home/index.html.erb[m
[1mindex 20145be..f169902 100644[m
[1m--- a/app/views/home/index.html.erb[m
[1m+++ b/app/views/home/index.html.erb[m
[36m@@ -1,5 +1,5 @@[m
 [m
[31m-<% @title="Fil des léçons" %>[m
[32m+[m[32m<% @title="Léçons" %>[m
 [m
 <%= render "home/shared/navbar" %> [m
 <main class="container mt-24">[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 4ef749c..92965fc 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -3,12 +3,16 @@[m [mRails.application.routes.draw do[m
   root to:'welcome#index'[m
   get "feeds", to:'home#index'[m
   [m
[32m+[m[32m  #Course[m
   get "course-list", to:"courses#index"[m
   get "lesson", to:"courses#new"[m
[31m-  get "new-materials", to:"materials#new"[m
[31m-  get "new-levels", to:"levels#new"[m
[32m+[m[41m  [m
[32m+[m[32m  #Dashboard[m
   get "dashboard-admin", to:'dashboard#index'[m
   get "setting", to:'dashboard#home'[m
[32m+[m[32m  get "new-materials", to:"materials#new"[m
[32m+[m[32m  get "new-levels", to:"levels#new"[m
[32m+[m[41m  [m
   [m
   resources :courses do[m
     resources :exercices, only: [:new, :create, :show, :index][m
[36m@@ -29,6 +33,8 @@[m [mRails.application.routes.draw do[m
   resources :answers, [m
             :questions,[m
             :results,[m
[32m+[m[32m            :levels,[m
[32m+[m[32m            :materials,[m
             :materials, execept: %i[new][m
   [m
   [m

[33mcommit 69a9de1a6211fa87a9844e221b88ad200392fe3d[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Sun Mar 20 12:00:35 2022 +0000

    app/views: add Home page basic

[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex f74b433..b37b05c 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -18,7 +18,7 @@[m
   </head>[m
 [m
   <body>[m
[31m-    <div class=" mx-auto flex">[m
[32m+[m[32m    <div class="bg-gray-200">[m
     <!-- Flash message-->[m
     <%= render "layouts/shared/flash/notices" %>[m
       <%= yield %>[m
[1mdiff --git a/app/views/welcome/index.html.erb b/app/views/welcome/index.html.erb[m
[1mindex a0e4806..a530c6c 100644[m
[1m--- a/app/views/welcome/index.html.erb[m
[1m+++ b/app/views/welcome/index.html.erb[m
[36m@@ -1,21 +1,10 @@[m
 [m
 [m
  [m
[31m-<% @title="welcome page" %>[m
[32m+[m[32m<% @title="Accueil" %>[m
 [m
 <%= render "welcome/shared/navbar" %>   [m
[31m-<main class="container-fluid">[m
[31m-  <div class=" p-5 rounded">[m
[31m-    <h1>Navbar example</h1>[m
[31m-    <p class="lead"> Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel, dignissimos laudantium debitis porro possimus voluptatum fugit molestias accusantium quas in, praesentium officia. Iusto cupiditate veniam consectetur alias tempora fuga deleniti?  This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>[m
[31m-    <p class="lead"> Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel, dignissimos laudantium debitis porro possimus voluptatum fugit molestias accusantium quas in, praesentium officia. Iusto cupiditate veniam consectetur alias tempora fuga deleniti?  This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>[m
[31m-    <p class="lead"> Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel, dignissimos laudantium debitis porro possimus voluptatum fugit molestias accusantium quas in, praesentium officia. Iusto cupiditate veniam consectetur alias tempora fuga deleniti?  This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>[m
[31m-    <p class="lead"> Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel, dignissimos laudantium debitis porro possimus voluptatum fugit molestias accusantium quas in, praesentium officia. Iusto cupiditate veniam consectetur alias tempora fuga deleniti?  This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>[m
[31m-    <p class="lead"> Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel, dignissimos laudantium debitis porro possimus voluptatum fugit molestias accusantium quas in, praesentium officia. Iusto cupiditate veniam consectetur alias tempora fuga deleniti?  This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>[m
[31m-    <p class="lead"> Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel, dignissimos laudantium debitis porro possimus voluptatum fugit molestias accusantium quas in, praesentium officia. Iusto cupiditate veniam consectetur alias tempora fuga deleniti?  This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>[m
[31m-    <p class="lead"> Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel, dignissimos laudantium debitis porro possimus voluptatum fugit molestias accusantium quas in, praesentium officia. Iusto cupiditate veniam consectetur alias tempora fuga deleniti?  This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>[m
[31m-    <p class="lead"> Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel, dignissimos laudantium debitis porro possimus voluptatum fugit molestias accusantium quas in, praesentium officia. Iusto cupiditate veniam consectetur alias tempora fuga deleniti?  This example is a quick exercise to illustrate how fixed to top navbar works. As you scroll, it will remain fixed to the top of your browser’s viewport.</p>[m
[31m-    <a class="btn btn-lg btn-primary" href="../components/navbar/" role="button">View navbar docs &raquo;</a>[m
[31m-  </div>[m
[31m-</main>[m
[32m+[m[32m  <%= render "welcome/shared/hero" %>[m[41m [m
[32m+[m[32m  <%= render "welcome/shared/main-2" %>[m[41m [m
[32m+[m[32m  <%= render "welcome/shared/main" %>[m[41m [m
 <%= render "welcome/shared/footer" %> [m
[1mdiff --git a/app/views/welcome/shared/_footer.html.erb b/app/views/welcome/shared/_footer.html.erb[m
[1mindex 9f2b09b..63edd7a 100644[m
[1m--- a/app/views/welcome/shared/_footer.html.erb[m
[1m+++ b/app/views/welcome/shared/_footer.html.erb[m
[36m@@ -1,6 +1,6 @@[m
[31m-<div class="b-example-divider"></div>[m
[32m+[m[32m<div class="b-example-divider "></div>[m
 [m
[31m-<div class="container">[m
[32m+[m[32m<div class="container-fluid bg-white">[m
   <footer class="py-3 my-4">[m
     <ul class="nav justify-content-center border-bottom pb-3 mb-3">[m
       <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>[m
[1mdiff --git a/app/views/welcome/shared/_hero.html.erb b/app/views/welcome/shared/_hero.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..d2b23fe[m
[1m--- /dev/null[m
[1m+++ b/app/views/welcome/shared/_hero.html.erb[m
[36m@@ -0,0 +1,20 @@[m
[32m+[m[32m<section class="text-gray-600 body-font">[m
[32m+[m[32m  <div class="container mx-auto flex px-5 py-24 md:flex-row flex-col items-center">[m
[32m+[m[32m    <div class="lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 flex flex-col md:items-start md:text-left mb-16 md:mb-0 items-center text-center">[m
[32m+[m[32m      <h1 class="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-900">Before they sold out[m
[32m+[m[32m        <br class="hidden lg:inline-block">readymade gluten[m
[32m+[m[32m      </h1>[m
[32m+[m[32m      <p class="mb-8 leading-relaxed">Copper mug try-hard pitchfork pour-over freegan heirloom neutra air plant cold-pressed tacos poke beard tote bag. Heirloom echo park mlkshk tote bag selvage hot chicken authentic tumeric truffaut hexagon try-hard chambray.</p>[m
[32m+[m[32m      <div class="flex justify-center">[m
[32m+[m[32m        <%= link_to "S'Inscrire gratuitement", "#", class:"inline-flex text-white bg-blue-500[m
[32m+[m[32m         border-0 py-2 px-1 focus:outline-none hover:bg-blue-600 rounded text-lg font-semibold no-underline" %>[m
[32m+[m[32m        <%= link_to "Voir le Prix", "#", class:"hidden md:block md:ml-4 inline-flex text-gray-900 bg-gray-100[m[41m [m
[32m+[m[32m        border-0 py-2 px-6 focus:outline-none hover:bg-gray-200 rounded text-lg hover:no-underline" %>[m
[32m+[m[32m      </div>[m
[32m+[m[32m        <%= link_to "Voir le Prix", "#", class:"md:hidden mt-4 text-gray-900 hover:no-underline decoration-dashed text-lg " %>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="lg:max-w-lg lg:w-full md:w-1/2 w-5/6">[m
[32m+[m[32m      <img class="object-cover object-center rounded" alt="hero" src="https://dummyimage.com/720x600">[m
[32m+[m[32m    </div>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</section>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/welcome/shared/_main-2.html.erb b/app/views/welcome/shared/_main-2.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..2a949d0[m
[1m--- /dev/null[m
[1m+++ b/app/views/welcome/shared/_main-2.html.erb[m
[36m@@ -0,0 +1,47 @@[m
[32m+[m[32m<div class="text-gray-600 body-font">[m
[32m+[m[32m  <div class=" px-5 py-24 mx-auto">[m
[32m+[m[32m    <div class="flex flex-wrap w-full mb-20">[m
[32m+[m[32m      <div class="lg:w-1/2 w-full mb-6 lg:mb-0">[m
[32m+[m[32m        <h1 class="sm:text-3xl text-2xl font-medium title-font mb-2 text-gray-900">Pitchfork Kickstarter Taxidermy</h1>[m
[32m+[m[32m        <div class="h-1 w-20 bg-indigo-500 rounded"></div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <p class="lg:w-1/2 w-full leading-relaxed text-gray-500">Whatever cardigan tote bag tumblr hexagon brooklyn asymmetrical gentrify, subway tile poke farm-to-table. Franzen you probably haven't heard of them man bun deep jianbing selfies heirloom prism food truck ugh squid celiac humblebrag.</p>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="flex flex-wrap -m-10">[m
[32m+[m[32m      <div class="xl:w-1/4 md:w-1/2 py-4 md:p-2">[m
[32m+[m[32m        <div class="bg-gray-100 p-2 rounded-lg">[m
[32m+[m[32m          <img class="h-40 rounded w-full object-cover object-center mb-6" src="https://dummyimage.com/720x400" alt="content">[m
[32m+[m[32m          <h3 class="tracking-widest text-indigo-500 text-xs font-medium title-font">SUBTITLE</h3>[m
[32m+[m[32m          <h2 class="text-lg text-gray-900 font-medium title-font mb-4">Chichen Itza</h2>[m
[32m+[m[32m          <p class="leading-relaxed text-base">Fingerstache flexitarian street art 8-bit waistcoat. Distillery hexagon disrupt edison bulbche.</p>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="xl:w-1/4 md:w-1/2 py-4 md:p-2">[m
[32m+[m[32m        <div class="bg-gray-100 p-2 rounded-lg">[m
[32m+[m[32m          <img class="h-40 rounded w-full object-cover object-center mb-6" src="https://dummyimage.com/720x400" alt="content">[m
[32m+[m[32m          <h3 class="tracking-widest text-indigo-500 text-xs font-medium title-font">SUBTITLE</h3>[m
[32m+[m[32m          <h2 class="text-lg text-gray-900 font-medium title-font mb-4">Chichen Itza</h2>[m
[32m+[m[32m          <p class="leading-relaxed text-base">Fingerstache flexitarian street art 8-bit waistcoat. Distillery hexagon disrupt edison bulbche.</p>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="xl:w-1/4 md:w-1/2 py-4 md:p-2">[m
[32m+[m[32m        <div class="bg-gray-100 p-2 rounded-lg">[m
[32m+[m[32m          <img class="h-40 rounded w-full object-cover object-center mb-6" src="https://dummyimage.com/720x400" alt="content">[m
[32m+[m[32m          <h3 class="tracking-widest text-indigo-500 text-xs font-medium title-font">SUBTITLE</h3>[m
[32m+[m[32m          <h2 class="text-lg text-gray-900 font-medium title-font mb-4">Chichen Itza</h2>[m
[32m+[m[32m          <p class="leading-relaxed text-base">Fingerstache flexitarian street art 8-bit waistcoat. Distillery hexagon disrupt edison bulbche.</p>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="xl:w-1/4 md:w-1/2 py-4 md:p-2">[m
[32m+[m[32m        <div class="bg-gray-100 p-2 rounded-lg">[m
[32m+[m[32m          <img class="h-40 rounded w-full object-cover object-center mb-6" src="https://dummyimage.com/720x400" alt="content">[m
[32m+[m[32m          <h3 class="tracking-widest text-indigo-500 text-xs font-medium title-font">SUBTITLE</h3>[m
[32m+[m[32m          <h2 class="text-lg text-gray-900 font-medium title-font mb-4">Chichen Itza</h2>[m
[32m+[m[32m          <p class="leading-relaxed text-base">Fingerstache flexitarian street art 8-bit waistcoat. Distillery hexagon disrupt edison bulbche.</p>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </div>[m
[32m+[m[41m      [m
[32m+[m[41m      [m
[32m+[m[32m    </div>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</div>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/welcome/shared/_main.html.erb b/app/views/welcome/shared/_main.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..a75f5c6[m
[1m--- /dev/null[m
[1m+++ b/app/views/welcome/shared/_main.html.erb[m
[36m@@ -0,0 +1,48 @@[m
[32m+[m[32m<section class="text-gray-600 body-font">[m
[32m+[m[32m  <div class=" px-5 py-24 mx-auto">[m
[32m+[m[32m    <div class="flex flex-col text-center w-full mb-20">[m
[32m+[m[32m      <h2 class="text-xs text-indigo-500 tracking-widest font-medium title-font mb-1">ROOF PARTY POLAROID</h2>[m
[32m+[m[32m      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">Master Cleanse Reliac Heirloom</h1>[m
[32m+[m[32m      <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Whatever cardigan tote bag tumblr hexagon brooklyn asymmetrical gentrify, subway tile poke farm-to-table. Franzen you probably haven't heard of them man bun deep jianbing selfies heirloom prism food truck ugh squid celiac humblebrag.</p>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="flex flex-wrap">[m
[32m+[m[32m      <div class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60">[m
[32m+[m[32m        <h2 class="text-lg sm:text-xl text-gray-900 font-medium title-font mb-2">Shooting Stars</h2>[m
[32m+[m[32m        <p class="leading-relaxed text-base mb-4">Fingerstache flexitarian street art 8-bit waistcoat. Distillery hexagon disrupt edison bulbche.</p>[m
[32m+[m[32m        <a class="text-indigo-500 inline-flex items-center">Learn More[m
[32m+[m[32m          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">[m
[32m+[m[32m            <path d="M5 12h14M12 5l7 7-7 7"></path>[m
[32m+[m[32m          </svg>[m
[32m+[m[32m        </a>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60">[m
[32m+[m[32m        <h2 class="text-lg sm:text-xl text-gray-900 font-medium title-font mb-2">The Catalyzer</h2>[m
[32m+[m[32m        <p class="leading-relaxed text-base mb-4">Fingerstache flexitarian street art 8-bit waistcoat. Distillery hexagon disrupt edison bulbche.</p>[m
[32m+[m[32m        <a class="text-indigo-500 inline-flex items-center">Learn More[m
[32m+[m[32m          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">[m
[32m+[m[32m            <path d="M5 12h14M12 5l7 7-7 7"></path>[m
[32m+[m[32m          </svg>[m
[32m+[m[32m        </a>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60">[m
[32m+[m[32m        <h2 class="text-lg sm:text-xl text-gray-900 font-medium title-font mb-2">Neptune</h2>[m
[32m+[m[32m        <p class="leading-relaxed text-base mb-4">Fingerstache flexitarian street art 8-bit waistcoat. Distillery hexagon disrupt edison bulbche.</p>[m
[32m+[m[32m        <a class="text-indigo-500 inline-flex items-center">Learn More[m
[32m+[m[32m          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">[m
[32m+[m[32m            <path d="M5 12h14M12 5l7 7-7 7"></path>[m
[32m+[m[32m          </svg>[m
[32m+[m[32m        </a>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="xl:w-1/4 lg:w-1/2 md:w-full px-8 py-6 border-l-2 border-gray-200 border-opacity-60">[m
[32m+[m[32m        <h2 class="text-lg sm:text-xl text-gray-900 font-medium title-font mb-2">Melanchole</h2>[m
[32m+[m[32m        <p class="leading-relaxed text-base mb-4">Fingerstache flexitarian street art 8-bit waistcoat. Distillery hexagon disrupt edison bulbche.</p>[m
[32m+[m[32m        <a class="text-indigo-500 inline-flex items-center">Learn More[m
[32m+[m[32m          <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-2" viewBox="0 0 24 24">[m
[32m+[m[32m            <path d="M5 12h14M12 5l7 7-7 7"></path>[m
[32m+[m[32m          </svg>[m
[32m+[m[32m        </a>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <button class="flex mx-auto mt-16 text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">Button</button>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</section>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/welcome/shared/_navbar.html.erb b/app/views/welcome/shared/_navbar.html.erb[m
[1mindex f471fd6..c6f4438 100644[m
[1m--- a/app/views/welcome/shared/_navbar.html.erb[m
[1m+++ b/app/views/welcome/shared/_navbar.html.erb[m
[36m@@ -6,23 +6,12 @@[m
           <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>[m
         </a>[m
         <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">[m
[31m-          <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>[m
[31m-          <li><a href="#" class="nav-link px-2 text-white">Features</a></li>[m
[31m-          <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>[m
[31m-          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>[m
[31m-          <li><a href="#" class="nav-link px-2 text-white">About</a></li>[m
[32m+[m[32m          <li><%= link_to 'Accueil', root_path, class:"nav-link px-2 text-secondary" %></li>[m
         </ul>[m
 [m
[31m-        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">[m
[31m-          <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">[m
[31m-        </form>[m
[31m-[m
[32m+[m[41m        [m
         <div class="text-end">[m
[31m-          [m
           <%= link_to 'Se Connecter',user_session_path, class:"btn btn-outline-light me-2" %>[m
[31m-          <%= link_to "S'Inscrire",new_user_registration_path, class:"btn btn-warning" %>[m
[31m-          <%= button_to 'Deconnecter', destroy_user_session_path, method: :delete , class:"btn btn-outline-light me-2" %>[m
[31m-          [m
         </div>[m
       </div>[m
     </div>[m
[1mdiff --git a/app/views/welcome/shared/_pricing.html.erb b/app/views/welcome/shared/_pricing.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..6efa7e0[m
[1m--- /dev/null[m
[1m+++ b/app/views/welcome/shared/_pricing.html.erb[m
[36m@@ -0,0 +1,191 @@[m
[32m+[m[32m<section class="text-gray-600 body-font overflow-hidden">[m
[32m+[m[32m  <div class="container px-5 py-24 mx-auto">[m
[32m+[m[32m    <div class="flex flex-col text-center w-full mb-20">[m
[32m+[m[32m      <h1 class="sm:text-4xl text-3xl font-medium title-font mb-2 text-gray-900">Pricing</h1>[m
[32m+[m[32m      <p class="lg:w-2/3 mx-auto leading-relaxed text-base text-gray-500">Whatever cardigan tote bag tumblr hexagon brooklyn asymmetrical.</p>[m
[32m+[m[32m      <div class="flex mx-auto border-2 border-blue-500 rounded overflow-hidden mt-6">[m
[32m+[m[32m        <button class="py-1 px-4 bg-blue-500 text-white focus:outline-none">Monthly</button>[m
[32m+[m[32m        <button class="py-1 px-4 focus:outline-none">Annually</button>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="flex flex-wrap -m-4">[m
[32m+[m[32m      <div class="p-4 xl:w-1/4 md:w-1/2 w-full">[m
[32m+[m[32m        <div class="h-full p-6 rounded-lg border-2 border-gray-300 flex flex-col relative overflow-hidden">[m
[32m+[m[32m          <h2 class="text-sm tracking-widest title-font mb-1 font-medium">START</h2>[m
[32m+[m[32m          <h1 class="text-5xl text-gray-900 pb-4 mb-4 border-b border-gray-200 leading-none">Free</h1>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Vexillologist pitchfork[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Tumeric plaid portland[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-6">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Mixtape chillwave tumeric[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <button class="flex items-center mt-auto text-white bg-gray-400 border-0 py-2 px-4 w-full focus:outline-none hover:bg-gray-500 rounded">Button[m
[32m+[m[32m            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-auto" viewBox="0 0 24 24">[m
[32m+[m[32m              <path d="M5 12h14M12 5l7 7-7 7"></path>[m
[32m+[m[32m            </svg>[m
[32m+[m[32m          </button>[m
[32m+[m[32m          <p class="text-xs text-gray-500 mt-3">Literally you probably haven't heard of them jean shorts.</p>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="p-4 xl:w-1/4 md:w-1/2 w-full">[m
[32m+[m[32m        <div class="h-full p-6 rounded-lg border-2 border-blue-500 flex flex-col relative overflow-hidden">[m
[32m+[m[32m          <span class="bg-blue-500 text-white px-3 py-1 tracking-widest text-xs absolute right-0 top-0 rounded-bl">POPULAR</span>[m
[32m+[m[32m          <h2 class="text-sm tracking-widest title-font mb-1 font-medium">PRO</h2>[m
[32m+[m[32m          <h1 class="text-5xl text-gray-900 leading-none flex items-center pb-4 mb-4 border-b border-gray-200">[m
[32m+[m[32m            <span>$38</span>[m
[32m+[m[32m            <span class="text-lg ml-1 font-normal text-gray-500">/mo</span>[m
[32m+[m[32m          </h1>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Vexillologist pitchfork[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Tumeric plaid portland[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Hexagon neutra unicorn[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-6">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Mixtape chillwave tumeric[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <button class="flex items-center mt-auto text-white bg-blue-500 border-0 py-2 px-4 w-full focus:outline-none hover:bg-blue-600 rounded">Button[m
[32m+[m[32m            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-auto" viewBox="0 0 24 24">[m
[32m+[m[32m              <path d="M5 12h14M12 5l7 7-7 7"></path>[m
[32m+[m[32m            </svg>[m
[32m+[m[32m          </button>[m
[32m+[m[32m          <p class="text-xs text-gray-500 mt-3">Literally you probably haven't heard of them jean shorts.</p>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="p-4 xl:w-1/4 md:w-1/2 w-full">[m
[32m+[m[32m        <div class="h-full p-6 rounded-lg border-2 border-gray-300 flex flex-col relative overflow-hidden">[m
[32m+[m[32m          <h2 class="text-sm tracking-widest title-font mb-1 font-medium">BUSINESS</h2>[m
[32m+[m[32m          <h1 class="text-5xl text-gray-900 leading-none flex items-center pb-4 mb-4 border-b border-gray-200">[m
[32m+[m[32m            <span>$56</span>[m
[32m+[m[32m            <span class="text-lg ml-1 font-normal text-gray-500">/mo</span>[m
[32m+[m[32m          </h1>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Vexillologist pitchfork[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Tumeric plaid portland[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Hexagon neutra unicorn[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Vexillologist pitchfork[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-6">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Mixtape chillwave tumeric[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <button class="flex items-center mt-auto text-white bg-gray-400 border-0 py-2 px-4 w-full focus:outline-none hover:bg-gray-500 rounded">Button[m
[32m+[m[32m            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-auto" viewBox="0 0 24 24">[m
[32m+[m[32m              <path d="M5 12h14M12 5l7 7-7 7"></path>[m
[32m+[m[32m            </svg>[m
[32m+[m[32m          </button>[m
[32m+[m[32m          <p class="text-xs text-gray-500 mt-3">Literally you probably haven't heard of them jean shorts.</p>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="p-4 xl:w-1/4 md:w-1/2 w-full">[m
[32m+[m[32m        <div class="h-full p-6 rounded-lg border-2 border-gray-300 flex flex-col relative overflow-hidden">[m
[32m+[m[32m          <h2 class="text-sm tracking-widest title-font mb-1 font-medium">SPECIAL</h2>[m
[32m+[m[32m          <h1 class="text-5xl text-gray-900 leading-none flex items-center pb-4 mb-4 border-b border-gray-200">[m
[32m+[m[32m            <span>$72</span>[m
[32m+[m[32m            <span class="text-lg ml-1 font-normal text-gray-500">/mo</span>[m
[32m+[m[32m          </h1>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Vexillologist pitchfork[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Tumeric plaid portland[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Hexagon neutra unicorn[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-2">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Vexillologist pitchfork[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <p class="flex items-center text-gray-600 mb-6">[m
[32m+[m[32m            <span class="w-4 h-4 mr-2 inline-flex items-center justify-center bg-gray-400 text-white rounded-full flex-shrink-0">[m
[32m+[m[32m              <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" class="w-3 h-3" viewBox="0 0 24 24">[m
[32m+[m[32m                <path d="M20 6L9 17l-5-5"></path>[m
[32m+[m[32m              </svg>[m
[32m+[m[32m            </span>Mixtape chillwave tumeric[m
[32m+[m[32m          </p>[m
[32m+[m[32m          <button class="flex items-center mt-auto text-white bg-gray-400 border-0 py-2 px-4 w-full focus:outline-none hover:bg-gray-500 rounded">Button[m
[32m+[m[32m            <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-auto" viewBox="0 0 24 24">[m
[32m+[m[32m              <path d="M5 12h14M12 5l7 7-7 7"></path>[m
[32m+[m[32m            </svg>[m
[32m+[m[32m          </button>[m
[32m+[m[32m          <p class="text-xs text-gray-500 mt-3">Literally you probably haven't heard of them jean shorts.</p>[m
[32m+[m[32m        </div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </div>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</section>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/welcome/shared/_sign_in.html.erb b/app/views/welcome/shared/_sign_in.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..c0b0de6[m
[1m--- /dev/null[m
[1m+++ b/app/views/welcome/shared/_sign_in.html.erb[m
[36m@@ -0,0 +1,21 @@[m
[32m+[m[32m<section class="text-gray-600 body-font">[m
[32m+[m[32m  <div class="container px-5 py-24 mx-auto flex flex-wrap items-center">[m
[32m+[m[32m    <div class="lg:w-3/5 md:w-1/2 md:pr-16 lg:pr-0 pr-0">[m
[32m+[m[32m      <h1 class="title-font font-medium text-3xl text-gray-900">Slow-carb next level shoindcgoitch ethical authentic, poko scenester</h1>[m
[32m+[m[32m      <p class="leading-relaxed mt-4">Poke slow-carb mixtape knausgaard, typewriter street art gentrify hammock starladder roathse. Craies vegan tousled etsy austin.</p>[m
[32m+[m[32m    </div>[m
[32m+[m[32m    <div class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">[m
[32m+[m[32m      <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Sign Up</h2>[m
[32m+[m[32m      <div class="relative mb-4">[m
[32m+[m[32m        <label for="full-name" class="leading-7 text-sm text-gray-600">Full Name</label>[m
[32m+[m[32m        <input type="text" id="full-name" name="full-name" class="w-full bg-white rounded border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <div class="relative mb-4">[m
[32m+[m[32m        <label for="email" class="leading-7 text-sm text-gray-600">Email</label>[m
[32m+[m[32m        <input type="email" id="email" name="email" class="w-full bg-white rounded border border-gray-300 focus:border-blue-500 focus:ring-2 focus:ring-blue-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">[m
[32m+[m[32m      </div>[m
[32m+[m[32m      <button class="text-white bg-blue-500 border-0 py-2 px-8 focus:outline-none hover:bg-blue-600 rounded text-lg">Button</button>[m
[32m+[m[32m      <p class="text-xs text-gray-500 mt-3">Literally you probably haven't heard of them jean shorts.</p>[m
[32m+[m[32m    </div>[m
[32m+[m[32m  </div>[m
[32m+[m[32m</section>[m
\ No newline at end of file[m

[33mcommit cdff14ad92d74a176395737d407f9d4700dfa03f[m[33m ([m[1;31mplatform/Membership_v2[m[33m, [m[1;31morigin/Membership_v2[m[33m, [m[1;32mMembership_v2[m[33m)[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Sat Mar 19 13:02:58 2022 +0000

    Add Membership

[1mdiff --git a/app/controllers/application_controller.rb b/app/controllers/application_controller.rb[m
[1mindex a74a782..6c97235 100644[m
[1m--- a/app/controllers/application_controller.rb[m
[1m+++ b/app/controllers/application_controller.rb[m
[36m@@ -3,21 +3,20 @@[m [mclass ApplicationController < ActionController::Base[m
     # Add sign up params[m
     protect_from_forgery with: :exception[m
     #login params[m
[32m+[m[41m    [m
     before_action :configure_permitted_parameters, if: :devise_controller?[m
     before_action :find_levels[m
     #before_action :find_schools[m
     #before_action :find_cityEreas[m
 [m
[31m-    #redirect current_user to feed if signed[m
[31m-    def current_user_auhenticate?[m
[31m-      redirect_to feeds_path if user_signed_in?[m
[31m-    end[m
[31m-[m
[31m-    #redirect current_user to feed if  not signed[m
[31m-    def current_user_unauhenticate[m
[31m-      redirect_to root_path  if !user_signed_in?[m
[32m+[m[41m   [m
[32m+[m[32m    def after_sign_in_path_for(resource)[m
[32m+[m[32m        if current_user.role === "Student"[m
[32m+[m[32m         feeds_path[m
[32m+[m[32m        else[m
[32m+[m[32m         root_path[m
[32m+[m[32m        end[m
     end[m
[31m-    [m
   [m
   protected[m
     # If you have extra params to permit, append them to the sanitizer.[m
[1mdiff --git a/app/controllers/welcome_controller.rb b/app/controllers/welcome_controller.rb[m
[1mindex b68d000..fa080c5 100644[m
[1m--- a/app/controllers/welcome_controller.rb[m
[1m+++ b/app/controllers/welcome_controller.rb[m
[36m@@ -7,7 +7,11 @@[m [mclass WelcomeController < ApplicationController[m
   private[m
     #redirect current_user to feed if signed[m
     def current_user_auhenticate?[m
[31m-     redirect_to feeds_path if :user_signed_in?[m
[32m+[m[32m      if :user_signed_in?[m
[32m+[m[32m        feeds_path[m
[32m+[m[32m      else[m
[32m+[m[32m        root_path[m
[32m+[m[32m      end[m
    end[m
   [m
 end[m
[1mdiff --git a/app/javascript/application.js b/app/javascript/application.js[m
[1mindex 0e3ab9c..541f201 100644[m
[1m--- a/app/javascript/application.js[m
[1m+++ b/app/javascript/application.js[m
[36m@@ -4,9 +4,12 @@[m [mimport "controllers"[m
 [m
 [m
 //  require bootstrap[m
[32m+[m[32m//= require bootstrap[m
 //= require jquery3[m
 //= require popper[m
[31m-//= require bootstrap[m
[32m+[m[32m//= require jquery[m
[32m+[m[32m//= require jquery_ujs[m
[32m+[m
 [m
 // rich_text import[m
 import "trix"[m
[1mdiff --git a/app/views/devise/registrations/new.html.erb b/app/views/devise/registrations/new.html.erb[m
[1mindex 75e6ec2..92a15ff 100644[m
[1m--- a/app/views/devise/registrations/new.html.erb[m
[1m+++ b/app/views/devise/registrations/new.html.erb[m
[36m@@ -3,11 +3,24 @@[m
 <%= form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f| %>[m
   <%= render "devise/shared/error_messages", resource: resource %>[m
 [m
[32m+[m[32m  <br />[m
   <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>[m
[32m+[m[32m    <%= f.label :Nom %><br />[m
[32m+[m[32m    <%= f.text_field :first_name, autofocus: true, autocomplete: "first_name", placeholder:"Prénom ...", class:"" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :Prénom %><br />[m
[32m+[m[32m    <%= f.text_field :last_name, placeholder:"Prénom ...", class:"" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :"N° Matricule" %><br />[m
[32m+[m[32m    <%= f.phone_field :matricule, placeholder:"N° Matricule ...", class:"" %>[m
   </div>[m
[31m-[m
[32m+[m[32m  <div class="field">[m
[32m+[m[32m    <%= f.label :"N° WhatsApp" %><br />[m
[32m+[m[32m    <%= f.phone_field :contact, placeholder:"N° WhatsApp ...", class:"" %>[m
[32m+[m[32m  </div>[m
[32m+[m[32m<%= f.hidden_field :role, value:"Student" %>[m
   <div class="field">[m
     <%= f.label :password %>[m
     <% if @minimum_password_length %>[m
[36m@@ -16,13 +29,8 @@[m
     <%= f.password_field :password, autocomplete: "new-password" %>[m
   </div>[m
 [m
[31m-  <div class="field">[m
[31m-    <%= f.label :password_confirmation %><br />[m
[31m-    <%= f.password_field :password_confirmation, autocomplete: "new-password" %>[m
[31m-  </div>[m
[31m-[m
   <div class="actions">[m
[31m-    <%= f.submit "Sign up", class:"btn btn-primary p-2 border rounded-md mt-2" %>[m
[32m+[m[32m    <%= f.submit "S'INSCRIRE", class:"btn btn-primary p-2 border rounded-md mt-2" %>[m
   </div>[m
 <% end %>[m
 [m
[1mdiff --git a/app/views/devise/sessions/new.html.erb b/app/views/devise/sessions/new.html.erb[m
[1mindex 42c513d..ee2e80b 100644[m
[1m--- a/app/views/devise/sessions/new.html.erb[m
[1m+++ b/app/views/devise/sessions/new.html.erb[m
[36m@@ -2,8 +2,8 @@[m
 [m
 <%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>[m
   <div class="field">[m
[31m-    <%= f.label :email %><br />[m
[31m-    <%= f.email_field :email, autofocus: true, autocomplete: "email" %>[m
[32m+[m[32m    <%= f.label :matricule %><br />[m
[32m+[m[32m    <%= f.text_field :logged, autofocus: true, autocomplete: "matricule" %>[m
   </div>[m
 [m
   <div class="field">[m
[1mdiff --git a/app/views/welcome/shared/_navbar.html.erb b/app/views/welcome/shared/_navbar.html.erb[m
[1mindex ac7ce8a..f471fd6 100644[m
[1m--- a/app/views/welcome/shared/_navbar.html.erb[m
[1m+++ b/app/views/welcome/shared/_navbar.html.erb[m
[36m@@ -21,7 +21,7 @@[m
           [m
           <%= link_to 'Se Connecter',user_session_path, class:"btn btn-outline-light me-2" %>[m
           <%= link_to "S'Inscrire",new_user_registration_path, class:"btn btn-warning" %>[m
[31m-          <%= link_to 'Deconnecter',destroy_user_session_path, class:"btn btn-outline-light me-2" %>[m
[32m+[m[32m          <%= button_to 'Deconnecter', destroy_user_session_path, method: :delete , class:"btn btn-outline-light me-2" %>[m
           [m
         </div>[m
       </div>[m
[1mdiff --git a/config/initializers/devise.rb b/config/initializers/devise.rb[m
[1mindex 5831403..2cfc276 100644[m
[1m--- a/config/initializers/devise.rb[m
[1m+++ b/config/initializers/devise.rb[m
[36m@@ -14,7 +14,7 @@[m [mDevise.setup do |config|[m
   # confirmation, reset password and unlock tokens in the database.[m
   # Devise will use the `secret_key_base` as its `secret_key`[m
   # by default. You can change it below and use your own secret key.[m
[31m-  # config.secret_key = '3c467dac9dc1492d746f83312b55c9147c17666153068c503ba96935e2483dcbf05a9fb5e0112307b3b2831e0f199dce5c588d67ef127fc74fc9bcffb74b192b'[m
[32m+[m[32m   config.secret_key = '3c467dac9dc1492d746f83312b55c9147c17666153068c503ba96935e2483dcbf05a9fb5e0112307b3b2831e0f199dce5c588d67ef127fc74fc9bcffb74b192b'[m
 [m
   # ==> Controller configuration[m
   # Configure the parent class to the devise controllers.[m
[36m@@ -46,7 +46,7 @@[m [mDevise.setup do |config|[m
   # session. If you need permissions, you should implement that in a before filter.[m
   # You can also supply a hash where the value is a boolean determining whether[m
   # or not authentication should be aborted when the value is not present.[m
[31m-  # config.authentication_keys = [:email][m
[32m+[m[32m   config.authentication_keys = [:logged][m
 [m
   # Configure parameters from the request object used for authentication. Each entry[m
   # given should be a request method and it will automatically be passed to the[m
[36m@@ -69,7 +69,7 @@[m [mDevise.setup do |config|[m
   # It can be set to an array that will enable params authentication only for the[m
   # given strategies, for example, `config.params_authenticatable = [:database]` will[m
   # enable it only for database (email + password) authentication.[m
[31m-  # config.params_authenticatable = true[m
[32m+[m[32m   config.params_authenticatable = true[m
 [m
   # Tell if authentication through HTTP Auth is enabled. False by default.[m
   # It can be set to an array that will enable http authentication only for the[m
[36m@@ -103,7 +103,7 @@[m [mDevise.setup do |config|[m
   # avoid CSRF token fixation attacks. This means that, when using AJAX[m
   # requests for sign in and sign up, you need to get a new CSRF token[m
   # from the server. You can disable this option at your own risk.[m
[31m-  # config.clean_up_csrf_token_on_authentication = true[m
[32m+[m[32m   config.clean_up_csrf_token_on_authentication = true[m
 [m
   # When false, Devise will not attempt to reload routes on eager load.[m
   # This can reduce the time taken to boot the app but if your application[m
[36m@@ -157,14 +157,14 @@[m [mDevise.setup do |config|[m
   # initial account confirmation) to be applied. Requires additional unconfirmed_email[m
   # db field (see migrations). Until confirmed, new email is stored in[m
   # unconfirmed_email column, and copied to email column on successful confirmation.[m
[31m-  config.reconfirmable = true[m
[32m+[m[32m  #config.reconfirmable = true[m
 [m
   # Defines which key will be used when confirming an account[m
   # config.confirmation_keys = [:email][m
 [m
   # ==> Configuration for :rememberable[m
   # The time the user will be remembered without asking for credentials again.[m
[31m-  # config.remember_for = 2.weeks[m
[32m+[m[32m   config.remember_for = 2.weeks[m
 [m
   # Invalidates all the remember me tokens when the user signs out.[m
   config.expire_all_remember_me_on_sign_out = true[m
[36m@@ -174,7 +174,7 @@[m [mDevise.setup do |config|[m
 [m
   # Options to be passed to the created cookie. For instance, you can set[m
   # secure: true in order to force SSL only cookies.[m
[31m-  # config.rememberable_options = {}[m
[32m+[m[32m   config.rememberable_options = {}[m
 [m
   # ==> Configuration for :validatable[m
   # Range for password length.[m
[36m@@ -244,11 +244,11 @@[m [mDevise.setup do |config|[m
   # Turn scoped views on. Before rendering "sessions/new", it will first check for[m
   # "users/sessions/new". It's turned off by default because it's slower if you[m
   # are using only default views.[m
[31m-  # config.scoped_views = false[m
[32m+[m[32m   config.scoped_views = true[m
 [m
   # Configure the default scope given to Warden. By default it's the first[m
   # devise role declared in your routes (usually :user).[m
[31m-  # config.default_scope = :user[m
[32m+[m[32m   config.default_scope = :user[m
 [m
   # Set this configuration to false if you want /users/sign_out to sign out[m
   # only the current scope. By default, Devise signs out all scopes.[m
[36m@@ -263,10 +263,10 @@[m [mDevise.setup do |config|[m
   # should add them to the navigational formats lists.[m
   #[m
   # The "*/*" below is required to match Internet Explorer requests.[m
[31m-  # config.navigational_formats = ['*/*', :html][m
[32m+[m[32m   config.navigational_formats = ['*/*', :html, :turbo_stream ][m
 [m
   # The default HTTP method used to sign out a resource. Default is :delete.[m
[31m-  config.sign_out_via = :delete[m
[32m+[m[32m  config.sign_out_via = :detele[m
 [m
   # ==> OmniAuth[m
   # Add a new OmniAuth provider. Check the wiki for more information on setting[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 99c182f..4ef749c 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -47,6 +47,7 @@[m [mRails.application.routes.draw do[m
                 :registration =>  'inscription',[m
                 :edit =>          'edit'[m
               }[m
[32m+[m[41m  [m
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html[m
 [m
   # Defines the root path route ("/")[m

[33mcommit 6036f52fa5347bbd4fb1b508714bfb9ed5f71b23[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Sat Mar 19 11:19:08 2022 +0000

    config/routes: add user routes

[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex e3da51f..99c182f 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -32,9 +32,21 @@[m [mRails.application.routes.draw do[m
             :materials, execept: %i[new][m
   [m
   [m
[31m-  devise_for :users, path: '', path_names: { sign_in: 'Connecter', [m
[31m-              sign_out: 'logout', password: 'secret', confirmation: 'verification',[m
[31m-              unlock: 'unblock', registration: '', sign_up: 'inscription-eleves' }[m
[32m+[m[32m  ######### USER DATA #########[m
[32m+[m[32m  devise_scope :user do[m
[32m+[m[32m    get 'profile/edit'    => 'devise/registrations#edit',   :as => :edit_user_registration[m
[32m+[m[32m    get 'profile/cancel'  => 'devise/registrations#cancel', :as => :cancel_user_registration[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  devise_for  :users,[m
[32m+[m[32m              :path => '',[m
[32m+[m[32m              :path_names =>[m[41m [m
[32m+[m[32m              { :sign_in =>     'connexion',[m
[32m+[m[32m                :sign_out =>     'logout',[m
[32m+[m[32m                :sign_up =>       '',[m
[32m+[m[32m                :registration =>  'inscription',[m
[32m+[m[32m                :edit =>          'edit'[m
[32m+[m[32m              }[m
   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html[m
 [m
   # Defines the root path route ("/")[m

[33mcommit e1a05892a4149fc9c29f0ea3a5738b615e284ab7[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Sat Mar 19 11:17:10 2022 +0000

    app: model/user.rb  Add membership validation

[1mdiff --git a/app/controllers/application_controller.rb b/app/controllers/application_controller.rb[m
[1mindex aaaec98..a74a782 100644[m
[1m--- a/app/controllers/application_controller.rb[m
[1m+++ b/app/controllers/application_controller.rb[m
[36m@@ -24,12 +24,13 @@[m [mclass ApplicationController < ActionController::Base[m
     def configure_permitted_parameters[m
     sign_up_params          = [ :first_name, :last_name, :full_name, :matricule, :level_name,[m
                                 :material_name, :school_name, :contact, :city_name, :role, :email,[m
[31m-                                :password, :slug, :gender][m
[32m+[m[32m                                :password, :slug, :gender, :payment,[m
[32m+[m[32m                                :avatar_profil][m
                                 [m
[31m-    update_sign_up_params  = [ :school_name, :status, :avatar_profil, :status_payment][m
[32m+[m[32m    #update_params  = [ :school_name, :status, :avatar_profil, :status_payment][m
      [m
     devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params[m
[31m-      devise_parameter_sanitizer.permit :account_update, keys: update_sign_up_params[m
[32m+[m[32m      devise_parameter_sanitizer.permit :account_update, keys: sign_up_params[m
       devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password][m
     end [m
 [m
[36m@@ -38,11 +39,11 @@[m [mclass ApplicationController < ActionController::Base[m
         @levels = Level.all[m
       end[m
       def find_schools[m
[31m-        @schools = School.all[m
[32m+[m[32m        #@schools = School.all[m
       end[m
       [m
       def find_cityEreas[m
[31m-        @city_ereas = CityErea.all[m
[32m+[m[32m        #@city_ereas = CityErea.all[m
       end[m
 [m
 end[m
[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mindex a525638..3878d24 100644[m
[1m--- a/app/models/user.rb[m
[1m+++ b/app/models/user.rb[m
[36m@@ -2,7 +2,7 @@[m [mclass User < ApplicationRecord[m
   # Include default devise modules. Others available are:[m
   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable[m
   devise :database_authenticatable, :registerable,[m
[31m-         :recoverable, :rememberable, :validatable[m
[32m+[m[32m         :recoverable, :rememberable, :validatable, :trackable, authentication_keys:[:logged][m
 [m
 ###############   RELATIONS ###################[m
   has_many :levels[m
[36m@@ -11,4 +11,88 @@[m [mclass User < ApplicationRecord[m
   has_many :exercices[m
   has_many :questions[m
   has_many :results[m
[32m+[m
[32m+[m
[32m+[m
[32m+[m[32m  attr_writer :logged[m
[32m+[m[32m  #enum :role, student: "student", teacher: "teacher", team: "team", default: "student"[m
[32m+[m[41m  [m
[32m+[m[32m  ################## VALIDATES  ###############[m
[32m+[m[32m   before_validation :user_student?,  on: :create[m
[32m+[m[41m   [m
[32m+[m[41m  [m
[32m+[m[32m   validates :first_name, :last_name, :full_name, :email, :password,[m
[32m+[m[32m              :contact, :role, presence: true[m
[32m+[m[41m    [m
[32m+[m[32m   validates :full_name,presence: true,[m
[32m+[m[32m              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ },[m
[32m+[m[32m              length: { minimum:5, maximum: 30,[m
[32m+[m[32m              message: "%{value} verifier votre nom complet"}[m
[32m+[m
[32m+[m[32m   validates :contact, uniqueness: true, numericality: { only_integer: true }, length: { minimum:10,[m
[32m+[m[32m              message: "%{ value} verifier votre nom numéro est 10 chiffres"}[m
[32m+[m[41m              [m
[32m+[m[32m   validates :role, inclusion: { in: %w(Student Teacher Team),[m
[32m+[m[32m                    message: "%{value} acces non identifier" }[m
[32m+[m
[32m+[m[32m   ############# CUSTOMIZE ###############""[m
[32m+[m[41m   [m
[32m+[m[32m   def user_student?[m
[32m+[m[32m    if self.role == "Student"[m
[32m+[m[32m      self.email = "#{self.matricule}@gmail.com" # if user.role == "Student"[m
[32m+[m[32m      self.password = "#{self.contact}"[m
[32m+[m[32m    end[m[41m    [m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  ################## LOGGED  #########[m
[32m+[m[32m  def logged[m
[32m+[m[32m    @logged || self.matricule || self.email[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  def user_team?[m
[32m+[m[32m    if self.role != "Team"[m
[32m+[m[32m      validates :city_name, presence: true, on: :create[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  def full_name[m
[32m+[m[32m    self.full_name = "#{self.first_name} #{self.last_name}"[m[41m [m
[32m+[m[32m  end[m[41m  [m
[32m+[m[41m  [m
[32m+[m[32m  def slug[m
[32m+[m[32m    if self.role === "Student"[m
[32m+[m[32m      self.slug = "civ #{self.full_name} #{self.level_name}"[m
[32m+[m[32m    elsif self.role === "Teacher"[m
[32m+[m[32m      self.slug = "civ #{self.full_name} #{self.material_name}"[m
[32m+[m[32m    else[m
[32m+[m[32m      self.slug = "civ #{self.full_name}"[m
[32m+[m[41m      [m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  ################## SLUG ###############[m
[32m+[m[32m  extend FriendlyId[m
[32m+[m[32m  friendly_id :full_name, use: :slugged[m
[32m+[m[41m  [m
[32m+[m[32m  def should_generate_new_friendly_id?[m
[32m+[m[32m    full_name_changed?[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  ################## BEFORE SAVE  #########[m
[32m+[m[32m  before_save do[m
[32m+[m[32m    self.contact            = contact.strip.squeeze(" ")[m
[32m+[m[32m    self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize[m
[32m+[m[32m    self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize[m
[32m+[m[32m  end[m
[32m+[m[41m    [m
[32m+[m[32m  ################## Logged params  #########[m
[32m+[m
[32m+[m[32m  def self.find_for_database_authentication(warden_conditions)[m
[32m+[m[32m    conditions = warden_conditions.dup[m
[32m+[m[32m    if logged = conditions.delete(:logged)[m
[32m+[m[32m      where(conditions.to_h).where(["lower(matricule) = :value OR lower(email) = :value", { :value => logged.downcase }]).first[m
[32m+[m[32m    elsif conditions.has_key?(:matricule) || conditions.has_key?(:email)[m
[32m+[m[32m      where(conditions.to_h).first[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
 end[m

[33mcommit 9c519a7f5542d5f113270f69d25d1263889dd858[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Sat Mar 19 11:08:10 2022 +0000

    add sign up params in application_controller

[1mdiff --git a/app/controllers/application_controller.rb b/app/controllers/application_controller.rb[m
[1mindex 1f6be59..aaaec98 100644[m
[1m--- a/app/controllers/application_controller.rb[m
[1m+++ b/app/controllers/application_controller.rb[m
[36m@@ -1,4 +1,48 @@[m
 class ApplicationController < ActionController::Base[m
 [m
[32m+[m[32m    # Add sign up params[m
[32m+[m[32m    protect_from_forgery with: :exception[m
[32m+[m[32m    #login params[m
[32m+[m[32m    before_action :configure_permitted_parameters, if: :devise_controller?[m
[32m+[m[32m    before_action :find_levels[m
[32m+[m[32m    #before_action :find_schools[m
[32m+[m[32m    #before_action :find_cityEreas[m
[32m+[m
[32m+[m[32m    #redirect current_user to feed if signed[m
[32m+[m[32m    def current_user_auhenticate?[m
[32m+[m[32m      redirect_to feeds_path if user_signed_in?[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    #redirect current_user to feed if  not signed[m
[32m+[m[32m    def current_user_unauhenticate[m
[32m+[m[32m      redirect_to root_path  if !user_signed_in?[m
[32m+[m[32m    end[m
[32m+[m[41m    [m
[32m+[m[41m  [m
[32m+[m[32m  protected[m
[32m+[m[32m    # If you have extra params to permit, append them to the sanitizer.[m
[32m+[m[32m    def configure_permitted_parameters[m
[32m+[m[32m    sign_up_params          = [ :first_name, :last_name, :full_name, :matricule, :level_name,[m
[32m+[m[32m                                :material_name, :school_name, :contact, :city_name, :role, :email,[m
[32m+[m[32m                                :password, :slug, :gender][m
[32m+[m[41m                                [m
[32m+[m[32m    update_sign_up_params  = [ :school_name, :status, :avatar_profil, :status_payment][m
[32m+[m[41m     [m
[32m+[m[32m    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params[m
[32m+[m[32m      devise_parameter_sanitizer.permit :account_update, keys: update_sign_up_params[m
[32m+[m[32m      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password][m
[32m+[m[32m    end[m[41m [m
[32m+[m
[32m+[m[32m    private[m
[32m+[m[32m      def find_levels[m
[32m+[m[32m        @levels = Level.all[m
[32m+[m[32m      end[m
[32m+[m[32m      def find_schools[m
[32m+[m[32m        @schools = School.all[m
[32m+[m[32m      end[m
[32m+[m[41m      [m
[32m+[m[32m      def find_cityEreas[m
[32m+[m[32m        @city_ereas = CityErea.all[m
[32m+[m[32m      end[m
 [m
 end[m
[1mdiff --git a/app/controllers/welcome_controller.rb b/app/controllers/welcome_controller.rb[m
[1mindex 049b05a..b68d000 100644[m
[1m--- a/app/controllers/welcome_controller.rb[m
[1m+++ b/app/controllers/welcome_controller.rb[m
[36m@@ -5,9 +5,9 @@[m [mclass WelcomeController < ApplicationController[m
   end[m
   [m
   private[m
[31m-  [m
[31m-  #redirect current_user to feed if signed[m
[31m-  def current_user_auhenticate?[m
[31m-    redirect_to feeds_path if :current_user[m
[32m+[m[32m    #redirect current_user to feed if signed[m
[32m+[m[32m    def current_user_auhenticate?[m
[32m+[m[32m     redirect_to feeds_path if :user_signed_in?[m
    end[m
[32m+[m[41m  [m
 end[m

[33mcommit 259783af2e0252f0f93c154a0b9ace1f5382a1c4[m[33m ([m[1;31mplatform/Build-Exercice[m[33m, [m[1;31morigin/Build-Exercice[m[33m, [m[1;32mBuild-Exercice[m[33m)[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Fri Mar 18 08:30:59 2022 +0000

    add exrcice

[1mdiff --git a/app/controllers/results_controller.rb b/app/controllers/results_controller.rb[m
[1mindex 8ac083e..263a31c 100644[m
[1m--- a/app/controllers/results_controller.rb[m
[1m+++ b/app/controllers/results_controller.rb[m
[36m@@ -7,7 +7,7 @@[m [mclass ResultsController < ApplicationController[m
   end[m
     [m
   def create[m
[31m-    @result =  current_user.results.buidl(results_params)[m
[32m+[m[32m    @result = Result.new(result_params.merge({user: current_user}))[m
     redirect_to course_path(@result.exercice.course) and return if @result.save[m
     render :new[m
   end[m
[36m@@ -58,6 +58,6 @@[m [mclass ResultsController < ApplicationController[m
 [m
     # Only allow a list of trusted parameters through.[m
     def result_params[m
[31m-      params.require(:result).permit(:user_id, :exercice_id)[m
[32m+[m[32m      params.require(:result).permit(:user_id, :exercice_id, answered_questions_attributes: [:answer_id, :question_id])[m
     end[m
 end[m
[1mdiff --git a/app/models/result.rb b/app/models/result.rb[m
[1mindex b84fb15..0897e21 100644[m
[1m--- a/app/models/result.rb[m
[1m+++ b/app/models/result.rb[m
[36m@@ -13,7 +13,7 @@[m [mclass Result < ApplicationRecord[m
 [m
 [m
   def grade[m
[31m-    correct = answers.where(correct_answer: true).count[m
[32m+[m[32m    correct = answers.where(correct: true).count[m
     percentage = (correct.to_f / answers.count.to_f) * 100[m
     return "#{percentage.to_i}%"[m
   end[m
[1mdiff --git a/app/views/courses/show.html.erb b/app/views/courses/show.html.erb[m
[1mindex e8a745e..9a176a3 100644[m
[1m--- a/app/views/courses/show.html.erb[m
[1m+++ b/app/views/courses/show.html.erb[m
[36m@@ -10,6 +10,9 @@[m
     <div class="inline-block ml-2">[m
       <%= button_to 'Destroy this course', course_path(@course), method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium" %>[m
     </div>[m
[32m+[m[32m    <h2 class="font-semibold text-xl m-2 mt-20">[m
[32m+[m[32m      <% if currentUserRole?(current_user) === ":teacher?" %> - <%= link_to 'Exercices', new_course_exercice_path(@course) %><% end %>[m
[32m+[m[32m    </h2>[m
     <%= link_to 'Back to courses', courses_path, class: "ml-2 rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
   </div>[m
 </div>[m
[1mdiff --git a/app/views/results/_form.html.erb b/app/views/results/_form.html.erb[m
[1mindex 291d55d..6de1699 100644[m
[1m--- a/app/views/results/_form.html.erb[m
[1m+++ b/app/views/results/_form.html.erb[m
[36m@@ -25,3 +25,28 @@[m
     <%= form.submit class: "rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer" %>[m
   </div>[m
 <% end %>[m
[32m+[m
[32m+[m
[32m+[m[32m<%= form_for @result, url: exercice_results_path(@result.exercice) do |f| %>[m
[32m+[m[32m        <%= render 'shared/validation_errors', :record => @result %>[m
[32m+[m[32m        <%= f.hidden_field :exercice_id %>[m
[32m+[m[32m        <ol>[m
[32m+[m[32m            <%= f.fields_for :answered_questions do |aq| %>[m
[32m+[m[32m                <div class="question">[m
[32m+[m[32m                    <li>[m
[32m+[m[32m                        <%= aq.hidden_field :question_id %>[m
[32m+[m[32m                        <p><%= aq.object.question.content %></p>[m
[32m+[m[32m                        <%= aq.collection_radio_buttons( :answer_id, aq.object.question.answers, :id, :content) do |b| %>[m
[32m+[m[32m                            <div class="border rounded-md p-2">[m
[32m+[m[32m                                <%= b.radio_button %>[m
[32m+[m[32m                                <%= b.label %>[m
[32m+[m[32m                            </div>[m
[32m+[m[32m                        <% end %>[m
[32m+[m[32m                    </li>[m
[32m+[m[32m                </div>[m
[32m+[m[32m            <% end %>[m
[32m+[m[32m        </ol>[m
[32m+[m
[32m+[m[32m        <%= f.submit "Valide", class:"rounded-lg py-3 px-5 bg-blue-600 text-white inline-block font-medium cursor-pointer" %>[m
[32m+[m
[32m+[m[32m    <% end %>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/results/new.html.erb b/app/views/results/new.html.erb[m
[1mindex 62f4f3b..85e87fe 100644[m
[1m--- a/app/views/results/new.html.erb[m
[1m+++ b/app/views/results/new.html.erb[m
[36m@@ -1,29 +1,7 @@[m
[31m-<div class="mx-auto md:w-2/3 w-full">[m
[31m- <div class="result-form">[m
[32m+[m[32m<div class="mx-auto">[m
[32m+[m[32m <div class="">[m
     <h1><%= @result.exercice.name %></h1>[m
[31m-    <%= form_for @result, url: exercice_results_path(@result.exercice) do |f| %>[m
[31m-        <%= render 'shared/validation_errors', :record => @result %>[m
[31m-        <%= f.hidden_field :exercice_id %>[m
[31m-        <ol>[m
[31m-            <%= f.fields_for :answered_questions do |aq| %>[m
[31m-                <div class="question">[m
[31m-                    <li>[m
[31m-                        <%= aq.hidden_field :question_id %>[m
[31m-                        <h3><%= aq.object.question.content %></h3>[m
[31m-                        <%= aq.collection_radio_buttons( :answer_id, aq.object.question.answers, :id, :content) do |b| %>[m
[31m-                            <div class="answer-choice">[m
[31m-                                <%= b.radio_button %>[m
[31m-                                <%= b.label %>[m
[31m-                            </div>[m
[31m-                        <% end %>[m
[31m-                    </li>[m
[31m-                </div>[m
[31m-            <% end %>[m
[31m-        </ol>[m
[31m-[m
[31m-        <%= f.submit "Valide" %>[m
[31m-[m
[31m-    <% end %>[m
[32m+[m[32m    <%= render "form", result: @result %>[m
 </div>[m
 [m
 [m
[1mdiff --git a/db/migrate/20220317192449_add_user_role_to_users.rb b/db/migrate/20220317192449_add_user_role_to_users.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..e6f185c[m
[1m--- /dev/null[m
[1m+++ b/db/migrate/20220317192449_add_user_role_to_users.rb[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32mclass AddUserRoleToUsers < ActiveRecord::Migration[7.0][m
[32m+[m[32m  def change[m
[32m+[m[32m    add_column :users, :role, :string[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
[1mdiff --git a/db/schema.rb b/db/schema.rb[m
[1mindex 780ad9a..e84372c 100644[m
[1m--- a/db/schema.rb[m
[1m+++ b/db/schema.rb[m
[36m@@ -10,7 +10,7 @@[m
 #[m
 # It's strongly recommended that you check this file into your version control system.[m
 [m
[31m-ActiveRecord::Schema[7.0].define(version: 2022_03_17_182753) do[m
[32m+[m[32mActiveRecord::Schema[7.0].define(version: 2022_03_17_192449) do[m
   # These are extensions that must be enabled in order to support this database[m
   enable_extension "pgcrypto"[m
   enable_extension "plpgsql"[m
[36m@@ -186,6 +186,7 @@[m [mActiveRecord::Schema[7.0].define(version: 2022_03_17_182753) do[m
     t.string "material_name"[m
     t.string "school_name"[m
     t.string "password_salt"[m
[32m+[m[32m    t.string "role"[m
     t.index ["email"], name: "index_users_on_email", unique: true[m
     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true[m
   end[m

[33mcommit 5e1e112c936e50c188aaf74aa4a37722e17bc030[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Thu Mar 17 18:34:42 2022 +0000

    add Exercice

[1mdiff --git a/app/controllers/results_controller.rb b/app/controllers/results_controller.rb[m
[1mindex 35b5be2..8ac083e 100644[m
[1m--- a/app/controllers/results_controller.rb[m
[1m+++ b/app/controllers/results_controller.rb[m
[36m@@ -7,7 +7,7 @@[m [mclass ResultsController < ApplicationController[m
   end[m
     [m
   def create[m
[31m-    @result = Result.new(results_params.merge({user: current_user}))[m
[32m+[m[32m    @result =  current_user.results.buidl(results_params)[m
     redirect_to course_path(@result.exercice.course) and return if @result.save[m
     render :new[m
   end[m
[36m@@ -26,7 +26,6 @@[m [mclass ResultsController < ApplicationController[m
   # GET /results/1/edit[m
   def edit[m
   end[m
[31m-cl[m
 [m
   # PATCH/PUT /results/1 or /results/1.json[m
   def update[m
[1mdiff --git a/db/migrate/20220317182753_create_answered_questions.rb b/db/migrate/20220317182753_create_answered_questions.rb[m
[1mnew file mode 100644[m
[1mindex 0000000..e51237e[m
[1m--- /dev/null[m
[1m+++ b/db/migrate/20220317182753_create_answered_questions.rb[m
[36m@@ -0,0 +1,11 @@[m
[32m+[m[32mclass CreateAnsweredQuestions < ActiveRecord::Migration[7.0][m
[32m+[m[32m  def change[m
[32m+[m[32m    create_table :answered_questions, id: :uuid do |t|[m
[32m+[m[32m      t.references :answer, null: false, foreign_key: true, type: :uuid[m
[32m+[m[32m      t.references :question, null: false, foreign_key: true, type: :uuid[m
[32m+[m[32m      t.references :result, null: false, foreign_key: true, type: :uuid[m
[32m+[m
[32m+[m[32m      t.timestamps[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m[32mend[m
[1mdiff --git a/db/schema.rb b/db/schema.rb[m
[1mindex 7c142c5..780ad9a 100644[m
[1m--- a/db/schema.rb[m
[1m+++ b/db/schema.rb[m
[36m@@ -10,7 +10,7 @@[m
 #[m
 # It's strongly recommended that you check this file into your version control system.[m
 [m
[31m-ActiveRecord::Schema[7.0].define(version: 2022_03_15_181939) do[m
[32m+[m[32mActiveRecord::Schema[7.0].define(version: 2022_03_17_182753) do[m
   # These are extensions that must be enabled in order to support this database[m
   enable_extension "pgcrypto"[m
   enable_extension "plpgsql"[m
[36m@@ -53,6 +53,17 @@[m [mActiveRecord::Schema[7.0].define(version: 2022_03_15_181939) do[m
     t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true[m
   end[m
 [m
[32m+[m[32m  create_table "answered_questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|[m
[32m+[m[32m    t.uuid "answer_id", null: false[m
[32m+[m[32m    t.uuid "question_id", null: false[m
[32m+[m[32m    t.uuid "result_id", null: false[m
[32m+[m[32m    t.datetime "created_at", null: false[m
[32m+[m[32m    t.datetime "updated_at", null: false[m
[32m+[m[32m    t.index ["answer_id"], name: "index_answered_questions_on_answer_id"[m
[32m+[m[32m    t.index ["question_id"], name: "index_answered_questions_on_question_id"[m
[32m+[m[32m    t.index ["result_id"], name: "index_answered_questions_on_result_id"[m
[32m+[m[32m  end[m
[32m+[m
   create_table "answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|[m
     t.text "content"[m
     t.boolean "correct"[m
[36m@@ -181,6 +192,9 @@[m [mActiveRecord::Schema[7.0].define(version: 2022_03_15_181939) do[m
 [m
   add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"[m
   add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"[m
[32m+[m[32m  add_foreign_key "answered_questions", "answers"[m
[32m+[m[32m  add_foreign_key "answered_questions", "questions"[m
[32m+[m[32m  add_foreign_key "answered_questions", "results"[m
   add_foreign_key "answers", "questions"[m
   add_foreign_key "courses", "users"[m
   add_foreign_key "exercices", "courses"[m

[33mcommit 9b7ebde930504929019c98c115c5623a65309265[m
Author: kamkara <lnclass.kamkara@gmail.com>
Date:   Thu Mar 17 18:14:36 2022 +0000

    add exercice ont course show

[1mdiff --git a/app/helpers/application_helper.rb b/app/helpers/application_helper.rb[m
[1mindex 78acf1e..29eb934 100644[m
[1m--- a/app/helpers/application_helper.rb[m
[1m+++ b/app/helpers/application_helper.rb[m
[36m@@ -46,6 +46,25 @@[m [mmodule ApplicationHelper[m
         flash_type.to_s[m
       end[m
     end[m
[31m-  [m
[32m+[m[41m    [m
[32m+[m[32m    #role[m
[32m+[m[32m  def currentUserRole?(current_user)[m
[32m+[m[32m    case current_user.role[m
[32m+[m[32m    when "Student"[m
[32m+[m[32m      ":student?"[m
[32m+[m[32m    when "Teacher"[m
[32m+[m[32m      ":teacher?"[m
[32m+[m[32m    when "Team"[m
[32m+[m[32m      ":team?"[m
[32m+[m[32m    else[m
[32m+[m[32m      ""[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
[32m+[m
[32m+[m[32m  def moderator?(current_user)[m
[32m+[m[32m    if current_user.role === "Team" || current_user.id ===  @course.user_id[m
[32m+[m[32m      ":moderator?"[m
[32m+[m[32m    end[m
[32m+[m[32m  end[m
 [m
 end[m
[1mdiff --git a/app/models/answeredQuestion.rb b/app/models/answeredQuestion.rb[m
[1mindex 8e6d92c..797044e 100644[m
[1m--- a/app/models/answeredQuestion.rb[m
[1m+++ b/app/models/answeredQuestion.rb[m
[36m@@ -5,4 +5,5 @@[m [mclass AnsweredQuestion < ApplicationRecord[m
 [m
   accepts_nested_attributes_for :answer[m
   accepts_nested_attributes_for :question[m
[32m+[m[41m  [m
 end[m
[1mdiff --git a/app/models/exercice.rb b/app/models/exercice.rb[m
[1mindex 69477c0..f403f7e 100644[m
[1m--- a/app/models/exercice.rb[m
[1m+++ b/app/models/exercice.rb[m
[36m@@ -1,5 +1,18 @@[m
 class Exercice < ApplicationRecord[m
 [m
[32m+[m[32m   scope :ready, -> { where("published == true")}[m
[32m+[m[32m  scope :chrono, -> { order(created_at: :desc)}[m
[32m+[m[41m   [m
[32m+[m[32m  has_many :questions, dependent: :destroy[m
[32m+[m[32m  belongs_to :user[m
[32m+[m[32m  belongs_to :course[m
[32m+[m[32m  has_many :results, dependent: :destroy[m
[32m+[m[32m  #has_many :notes[m
[32m+[m[41m    [m
[32m+[m[32m  validates_with ExerciceValidator, on: :create[m
[32m+[m[32m  validates_with PublicationValidator, on: :update[m
[32m+[m[41m  [m
[32m+[m
   #############  Relations ######[m
   has_many :questions, dependent: :destroy[m
   belongs_to :user[m
[36m@@ -11,7 +24,22 @@[m [mclass Exercice < ApplicationRecord[m
   validates_with ExerciceValidator, on: :create[m
   validates_with PublicationValidator, on: :update[m
   [m
[31m- [m
[32m+[m[32m  #current user completed exercice[m
[32m+[m[32m    def completed_by(user)[m
[32m+[m[32m        results.any? {|r| r.user == user}[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    #current user grade[m
[32m+[m[32m    def user_grade(user)[m
[32m+[m[32m        results.where(user_id: user).first.grade()[m
[32m+[m[32m    end[m
[32m+[m
[32m+[m[32m    #build result[m
[32m+[m[32m    def build_result[m
[32m+[m[32m        r = self.results.build()[m
[32m+[m[32m        self.questions.each {|q| r.answered_questions.build(question: q)}[m
[32m+[m[32m        return r[m
[32m+[m[32m    end[m
 [m
   #SLUG[m
   extend FriendlyId[m
[36m@@ -20,4 +48,5 @@[m [mclass Exercice < ApplicationRecord[m
   def should_generate_new_friendly_id?[m
     name_changed?[m
   end[m
[32m+[m[41m  [m
 end[m
[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mindex a8a2c2f..a525638 100644[m
[1m--- a/app/models/user.rb[m
[1m+++ b/app/models/user.rb[m
[36m@@ -9,7 +9,6 @@[m [mclass User < ApplicationRecord[m
   has_many :materials[m
   has_many :courses[m
   has_many :exercices[m
[31m-  has_many :answers[m
   has_many :questions[m
   has_many :results[m
 end[m
[1mdiff --git a/app/views/courses/_course.html.erb b/app/views/courses/_course.html.erb[m
[1mindex 1de7e97..25e102d 100644[m
[1m--- a/app/views/courses/_course.html.erb[m
[1m+++ b/app/views/courses/_course.html.erb[m
[36m@@ -7,12 +7,13 @@[m
     <%= course.content %>[m
   </p>[m
 [m
[31m-[m
[31m-  <p class="my-5">[m
[31m-    <strong class="block font-medium mb-1">Published:</strong>[m
[31m-    <%= course.published %>[m
[31m-  </p>[m
[31m-[m
[32m+[m[32m  <!-- Add exercices list for medium--->[m
[32m+[m[32m    <div class="card mt-2 md:w-2/3">[m
[32m+[m[32m      <div class="m-2">[m
[32m+[m[32m      <p class="font-bold text-md "> Commencez les exercices</p>[m
[32m+[m[32m      <%= render partial: "courses/shared/exercices",locals: {course: @course} %>[m
[32m+[m[32m    </div>[m
[32m+[m[41m    [m
   <% if action_name != "show" %>[m
     <%= link_to "Show this course", course, class: "rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
     <%= link_to 'Edit this course', edit_course_path(course), class: "rounded-lg py-3 ml-2 px-5 bg-gray-100 inline-block font-medium" %>[m
[1mdiff --git a/app/views/home/shared/exercices/_completed.html.erb b/app/views/courses/shared/_completed_exercices.html.erb[m
[1msimilarity index 95%[m
[1mrename from app/views/home/shared/exercices/_completed.html.erb[m
[1mrename to app/views/courses/shared/_completed_exercices.html.erb[m
[1mindex eb8cd6a..01d213f 100644[m
[1m--- a/app/views/home/shared/exercices/_completed.html.erb[m
[1m+++ b/app/views/courses/shared/_completed_exercices.html.erb[m
[36m@@ -4,4 +4,4 @@[m
     </div>[m
     <p>Grade: <%= q.user_grade(current_user) %></p>[m
     <!--  link_to "+Note", notes_quiz_path(q.id)    -->[m
[31m-</section>[m
[32m+[m[32m</section>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/courses/shared/_exercices.html.erb b/app/views/courses/shared/_exercices.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..7b1474c[m
[1m--- /dev/null[m
[1m+++ b/app/views/courses/shared/_exercices.html.erb[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32m <% course.exercices.chrono.each do |q| %>[m
[32m+[m[32m    <% if q.completed_by(current_user) %>[m
[32m+[m[32m        <%= render partial: "courses/shared/completed_exercices", locals: {q: q} %>[m
[32m+[m[32m    <% else %>[m
[32m+[m[32m        <%= render partial: "courses/shared/unattempted_exercices", locals: {q: q} %>[m
[32m+[m[32m    <% end %>[m
[32m+[m[32m<% end %>[m
[1mdiff --git a/app/views/courses/shared/_moreOptions.html.erb b/app/views/courses/shared/_moreOptions.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..e841f1c[m
[1m--- /dev/null[m
[1m+++ b/app/views/courses/shared/_moreOptions.html.erb[m
[36m@@ -0,0 +1,17 @@[m
[32m+[m[32m<div class="card rounded-md mt-2 -mx-2 flex ">[m
[32m+[m[32m    <%= link_to  edit_course_path(@course), class:"mx-2 mt-2 no-underline font-semibold" do %>[m
[32m+[m[32m        <i class="fas fa-pen-square"></i> Modifier[m
[32m+[m[32m    <% end %>[m
[32m+[m
[32m+[m[32m    <%= link_to course_path(@course), method: :delete, class:"mx-2 mt-2 no-underline font-semibold" do %>[m
[32m+[m[32m        <i class="fas fa-pen-square"></i> Supprimer[m
[32m+[m[32m    <% end %>[m
[32m+[m[41m    [m
[32m+[m[32m</div>[m
[32m+[m
[32m+[m[32m<% if action_name != "show" %>[m
[32m+[m[32m    <%= link_to "Show this course", course, class: "rounded-lg py-3 px-5 bg-gray-100 inline-block font-medium" %>[m
[32m+[m[32m    <%= link_to 'Edit this course', edit_course_path(course), class: "rounded-lg py-3 ml-2 px-5 bg-gray-100 inline-block font-medium" %>[m
[32m+[m[32m    <%= link_to 'Add Exercise', new_course_exercice_path(course), class: "rounded-lg py-3 ml-2 px-5 bg-gray-100 inline-block font-medium" %>[m
[32m+[m[32m    <hr class="mt-6">[m
[32m+[m[32m  <% end %>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/home/shared/exercices/_unattempted.html.erb b/app/views/courses/shared/_unattempted_exercices.html.erb[m
[1msimilarity index 100%[m
[1mrename from app/views/home/shared/exercices/_unattempted.html.erb[m
[1mrename to app/views/courses/shared/_unattempted_exercices.html.erb[m
[1mdiff --git a/app/views/courses/shared/_whatsappShared.html.erb b/app/views/courses/shared/_whatsappShared.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..552727e[m
[1m--- /dev/null[m
[1m+++ b/app/views/courses/shared/_whatsappShared.html.erb[m
[36m@@ -0,0 +1,6 @@[m
[32m+[m
[32m+[m
[32m+[m[32m<div class="m-2">[m[41m [m
[32m+[m[32m    <span class="font-bold"> 👉🏿 <%= current_user.last_name %> </span> Soit gentil, informez vos camarades classe![m[41m [m
[32m+[m[32m    <br />  👉🏿<a href="https://wa.me/?text=🇨🇮 *💡 Bac 2021-2022 J'utilise maintenant la nouvelle pateforme Lnclass.com pour étudier mes léçons de Tle et faire des exercices<br/>👇 Découvre toi aussi* bit.ly/3IqsnkL" class="font-bold">   Lancez Information sur WhatsApp</a>[m
[32m+[m[32m</div>[m
\ No newline at end of file[m
[1mdiff --git a/app/views/home/shared/_exercices.html.erb b/app/views/home/shared/_exercices.html.erb[m
[1mdeleted file mode 100644[m
[1mindex cea33e4..0000000[m
[1m--- a/app/views/home/shared/_exercices.html.erb[m
[1m+++ /dev/null[m
[36m@@ -1,9 +0,0 @@[m
[31m- <!-- show exercice-->[m
[31m- <% @FeedExercices.CourseFinder.each do |q| %>[m
[31m-    <!-- completed by exercice-->[m
[31m-    <% if q.completed_by(current_user) %>[m
[31m-        <%= render partial: "home/shared/exercices/completed", locals: {q: q} %>[m
[31m-    <% else %>[m
[31m-        <%= render partial: "home/shared/exercices/unattempted", locals: {q: q} %>[m
[31m-    <% end %>[m
[31m-<% end %>[m
[1mdiff --git a/app/views/home/shared/_feeds.html.erb b/app/views/home/shared/_feeds.html.erb[m
[1mindex 25dfee1..9b67a4d 100644[m
[1m--- a/app/views/home/shared/_feeds.html.erb[m
[1m+++ b/app/views/home/shared/_feeds.html.erb[m
[36m@@ -6,7 +6,10 @@[m
         <!-- Courses-->[m
         <div class="border rounded-md mt-2">[m
             <div class="p-2">[m
[31m-                <%= c.content %>[m
[32m+[m[32m                <%= link_to course_path(c), class:"hover:text-black text-black no-underline" do %>[m
[32m+[m[32m              <%= truncate(strip_tags(c.content.to_s.html_safe), length: 500) %>[m
[32m+[m[32m              <span class="bg-blue-300 rounded-md" id=start-reading><i class="mx-2">Continuez la lecture ...</i></span>[m
[32m+[m[32m            <% end %>[m
             </div>[m
             <!-- Feed Bar-->[m
             <%= render "home/shared/feeds_bar" %>[m
[36m@@ -15,7 +18,7 @@[m
         <div class="border rounded-md mt-2">[m
             <div class="p-2">[m
             <p class="font-bold text-md "> Commencez les exercices</p>[m
[31m-                <%= render "home/shared/exercices" %>[m
[32m+[m[41m               [m
             </div>[m
             <!-- Exercise Bar -->[m
             <div class="border-top flex items-center p-2">[m
[1mdiff --git a/config/routes.rb b/config/routes.rb[m
[1mindex 5c33b40..e3da51f 100644[m
[1m--- a/config/routes.rb[m
[1m+++ b/config/routes.rb[m
[36m@@ -2,33 +2,35 @@[m [mRails.application.routes.draw do[m
   [m
   root to:'welcome#index'[m
   get "feeds", to:'home#index'[m
[31m-  resources :courses do[m
[31m-    resources :exercices, only: [:new, :create, :show, :index][m
[31m-    get "exercices", to:"exercices#index"[m
[31m-    post '/publish', to: 'exercices#publish'[m
[31m-  end[m
   [m
   get "course-list", to:"courses#index"[m
   get "lesson", to:"courses#new"[m
   get "new-materials", to:"materials#new"[m
   get "new-levels", to:"levels#new"[m
[31m-  [m
   get "dashboard-admin", to:'dashboard#index'[m
   get "setting", to:'dashboard#home'[m
[32m+[m[41m  [m
[32m+[m[32m  resources :courses do[m
[32m+[m[32m    resources :exercices, only: [:new, :create, :show, :index][m
[32m+[m[32m    get "exercices", to:"exercices#index"[m
[32m+[m[32m    post '/publish', to: 'exercices#publish'[m
[32m+[m[32m  end[m
[32m+[m[41m  [m
   resources :exercices, except: [:new, :show, :edit, :create, :update, :destroy, :index] do[m
     member do[m
       delete 'delete', to: 'exercices#destroy'[m
     end[m
     resources :questions, only: [:new, :create, :destroy][m
[31m-    #resources :results, only: [:new, :create][m
[32m+[m[32m    resources :results, only: [:new, :create][m
   end[m
   [m
[32m+[m[41m  [m
   resources :courses, except: %i[index new][m
[31m-  resources :answers[m
[31m-  resources :questions  [m
[31m-  resources :materials, execept: %i[new][m
[31m-  resources :levels, execept: %i[new][m
[31m-  resources :results[m
[32m+[m[32m  resources :answers,[m[41m [m
[32m+[m[32m            :questions,[m
[32m+[m[32m            :results,[m
[32m+[m[32m            :materials, execept: %i[new][m
[32m+[m[41m  [m
   [m
   devise_for :users, path: '', path_names: { sign_in: 'Connecter', [m
               sign_out: 'logout', password: 'secret', confirmation: 'verification',[m
