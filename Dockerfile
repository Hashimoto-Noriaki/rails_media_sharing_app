# ベースイメージの指定
FROM ruby:3.1.2

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# 作業ディレクトリの作成
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile Gemfile.lock /app/

# Gemのインストール
RUN bundle install

# アプリケーションのソースコードをコピー
COPY . /app

# サーバーの起動
CMD ["rails", "server", "-b", "0.0.0.0"]