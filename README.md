# Easy Waiting Room

待合室の簡易的実装。

## How it works

オリジンの前段で動作し、アクセスユーザーに受付番号を発行する（受付番号は受付順に1からインクリメントする）。受付番号が受け入れ可能数以内の場合はオリジンを返し、そうでない場合は待合室画面を返す。

## Development

起動
```
docker compose up
```

URL
```
http:localhost:3000 # waiting room
http:localhost:3000/admin # admin
```
