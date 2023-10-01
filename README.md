<div align="center">
<img src="./assets/icon/ios_icon_1024.png" width="300">
</div>

# TesTes

Ah, Ah, Testing... Testing...

## Getting Started

```shell
make setup

// When you want to run build runner
make build run

// When you want to run pub get
make pub
```

## Architecture

![依存フロー](./docs/images/dependency.png)

### UI

ユーザとのインタラクションを担当する

### State

UIの状態管理を担当する

ユーザのアクションに基づいて状態をAsyncValueで更新しUIに通知する

### Service

ビジネスロジックを担当する

Repositoryにデータを渡す際はここで加工する

Serviceは複数Repositoryに依存可能

### Repository

データの永続化を担当する

DBへアクセスを行い、データの読み書きを行う

## Tech Stack

### maestro

<img src="https://559345148-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2Fn5KVIOjVkVjYRyVWZ0yT%2Ficon%2FiWOlXXbwVTJ9BL1NdnUu%2Ficon-w-bg.svg?alt=media&token=db2884aa-e09e-4296-b8c7-ac8f1c709343" width="100">

https://maestro.mobile.dev/getting-started/installing-maestro

```shell
$ curl -Ls "https://get.maestro.mobile.dev" | bash
```

### Shorebird

<img src="https://shorebird.dev/open-graph.png" width="200">

https://docs.shorebird.dev/

```shell
shorebird patch android
```
