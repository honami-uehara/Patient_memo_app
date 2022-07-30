FROM ruby:3.0.3

# ビルド時に実行するコマンドの指定
# インストール可能なパッケージの一覧の更新
RUN apt-get update -qq \
    # パッケージのインストール（nodejs、npmを指定）
    && apt-get install -y nodejs npm \
    && rm -rf /var/lib/apt/lists/* \
    && npm install --global yarn
RUN bundle exec bin/webpack-dev-server

# 作業ディレクトリの指定
WORKDIR /patient-memo-app
COPY Gemfile /patient-memo-app/Gemfile
COPY Gemfile.lock /patient-memo-app/Gemfile.lock
RUN bundle install
COPY . /patient-memo-app
CMD ["rails", "server", "-b", "0.0.0.0"]
