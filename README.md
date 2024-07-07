### push前
```
docker compose run web bundle exec rubocop -A
```
レビュアーがいないのでRuboCopでカバーする。マージ前はGitHubActionsを使用。

### bundle install
```
docker compose run web bundle install
```
