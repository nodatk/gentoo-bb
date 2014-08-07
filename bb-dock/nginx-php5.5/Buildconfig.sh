#
# build config
#
PACKAGES="nginx dev-lang/php:5.5 dev-php/xdebug"

#
# this method runs in the bb builder container just before starting the build of the rootfs
# 
configure_rootfs_build()
{
    echo 'NGINX_MODULES_HTTP="access auth_basic autoindex charset fastcgi gzip gzip_static limit_req map proxy rewrite scgi ssi stub_status"' >> /etc/portage/make.conf
    echo 'NGINX_MODULES_MAIL=""' >> /etc/portage/make.conf
    echo 'PHP_TARGETS="php5-5"' >> /etc/portage/make.conf
    echo 'PHP_INI_VERSION="production"' >> /etc/portage/make.conf

    echo 'dev-lang/php bcmath calendar curl curlwrappers fpm gd mhash mysql mysqli pdo soap sockets xmlreader xmlrpc xmlwriter xpm xsl zip' > /etc/portage/package.use/php
    echo 'app-admin/eselect-php fpm' >> /etc/portage/package.use/php
    echo 'dev-lang/pecl-apcu mmap' > /etc/portage/package.use/apcu
}

#
# this method runs in the bb builder container just before tar'ing the rootfs
# 
finish_rootfs_build()
{
    :
}