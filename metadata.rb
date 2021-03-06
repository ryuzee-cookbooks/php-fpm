name             'php-fpm'
maintainer       'Ryutaro YOSHIBA'
maintainer_email 'ryuzee@gmail.com'
license          'MIT'
description      'Installs/Configures php-env'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends          'ca-certificates'
depends          'yum', "~> 3.3"
depends          'yum-epel'
depends          'nginx', "~> 0.1.1"
