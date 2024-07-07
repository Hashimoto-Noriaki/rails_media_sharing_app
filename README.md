### push前
```
docker compose run web bundle exec rubocop -A
```
レビュアーがいないのでRuboCopでカバーする。マージ前はGitHubActionsを使用。

### コンテナに入る
```
docker compose run web bash              
```

### bundle install
```
docker compose run web bundle install
```
