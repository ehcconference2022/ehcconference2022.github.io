FROM jekyll/builder:4.0

WORKDIR /tmp
ADD Gemfile /tmp/
#ADD Gemfile.lock /tmp/
#RUN chmod a+rwx /tmp/Gemfile.lock
RUN bundle install
RUN bundle

FROM jekyll/jekyll:4.0

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll", "serve", "--livereload", "--config", "_config.yml,_config_dev.yml"]
# "-H", "0.0.0.0", 