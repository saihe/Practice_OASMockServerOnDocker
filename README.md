# Practice_OASMockServerOnDocker

OASでモックサーバをdocker上で動かす。

## usage

- コマンド実行

``` sh
docker-compose up --build
```

- シェル実行

``` sh
up.sh
```

- サンプルリクエスト

``` sh
curl -X GET --header 'Accept: application/json' 'http://localhost:8080/user/1'
```
