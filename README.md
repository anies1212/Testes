# flutter_hackathon_2023

We are Epoch

## Getting Started

## Architecture

![依存フロー](./docs/images/dependency.png)

### UI

ユーザとのインタラクションを担当する

### State

UIの状態管理を担当する

ユーザのアクションに基づいて状態を更新しUIに通知する

### Service

ビジネスロジックを担当する

Repositoryにデータを渡す際はここで加工する

### Repository

データの永続化を担当する

DBへアクセスを行い、データの読み書きを行う
