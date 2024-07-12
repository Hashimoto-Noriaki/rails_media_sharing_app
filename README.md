# README

### 環境構築(Docker) Rails側

- ビルド
```
docker compose build
```
- 起動
```
docker compose up -d
```
- 停止
```
docker compose down
```
### コンテナに入る
```
docker compose run web bash  
```
コンテナに入ったらdocker compose run webは不要

### サーバー起動とDB
- DB作成
```
docker compose　run web rails db:create
```
- マイグレーション実行と確認
```
docker compose　run web rails db:migrate
docker compose　run web rails db:migrate:status
```
- サーバー起動
```
docker compose　run web rails s
docker compose　run web rails server
```

http://127.0.0.1:3000/
### Gemfileに追記したら
1.
```
docker compose build
```
2.
```
docker compose run web bundle install
or
docker compose run web bundle update
```

### RuboCop
RuboCop起動
```
docker compose　run web bundle exec rubocop
```
RuboCopで修正
```
docker compose　run web bundle exec rubocop -A
```

### RSpec
RSpec起動
```
docker compose run web bundle exec rspec
```

### フロント側
ReactかVue.jsでリプレース予定

### GitHubActions
develpmentからmasterへpushするタイミング

### インフラ環境、デプロイ環境GCP
クラウド
- CloudRun
- CloudRunJobs
- CloudBuild
- ArtifactRegistry

### なぜこの構成か
月10円とかで運用できて、経費削減できるため

### Cloud Run
アプリのデプロイ先 (Dockerイメージを元に実行)

### CloudRunJobs
バッチ処理用のアプリをデプロイして定期実行するもの(Dockerイメージを元に実行)

### ArtifactRegistry
Dockerのコンテナイメージの保管先 (このイメージを元にCloudRunやCloudRunJobsにデプロイする)
