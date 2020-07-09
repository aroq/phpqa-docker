FROM composer

RUN apk update && apk add libxslt-dev && docker-php-ext-install xsl

RUN composer global require hirak/prestissimo
RUN composer global require \
friendsofphp/php-cs-fixer \
sensiolabs/security-checker \
jakub-onderka/php-parallel-lint \
edgedesign/phpqa --update-no-dev

ENTRYPOINT ["/tmp/vendor/bin/phpqa"]
CMD ["--help"]
