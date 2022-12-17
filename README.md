# BrainVim
Brainfu*kコードをVimコマンドに変換

# 使い方
## Brainfu*kコードをVimコマンドに変換する
```console
./convert.sh {Brainfu*cファイル}
```
変換されたcommand.vimが生成される．

## Brainfu*kコードをVimコマンドに変換して実行
```console
./run.sh {Brainfu*cファイル}
```
|オプション|説明|
|-|-|
|-n|変換せずにcommand.vimを実行する|
|-c|Debugモード(Brainfu*kコードをループアンロールしてから変換する)|

# 使用例
```console
$ ./convert.sh sample/hello_world.bf # Brainfu*kコードを変換
convert success
$ vim -u None -s command.vim out # 変換されたVimコマンドを実行
$ cat out # 実行結果を確認する
Hello World!

```
```console
$ ./run.sh sample/hello_world.bf # 上記処理をまとめて行う
convert success
Hello World!

```

# 原理
詳細はブログで公開している．

