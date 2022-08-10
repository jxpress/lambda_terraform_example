# 動作確認環境

- terraform v1.2.4

# 使い方

terraformを使用した、Python Lambdaをリリースするまで。

## （１）Lambda関数のパッケージを作る

```bash
docker run -v ${PWD}:/opt/app --rm -it python:3.8 /bin/sh -c 'apt update && apt install zip && pip install pipenv && cd /opt/app && ./build-pkg.sh'
```

## （２）terraform applyコマンドを実行する

```bash
cd terraform && terraform init && terraform apply
```
