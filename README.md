## アプリケーション名

患者情報メモアプリ

## アプリケーション概要

患者情報メモアプリは歯科医院向けのカルテに記載する手書きのコメントをデジタル化し、<br>
必要な時に瞬時に患者情報を検索でき、情報共有、カルテを探す手間を省くことをできることを目的としたアプリです。


## なぜ作ったか

私自身、現在歯科衛生士として勤務しています。<br>
病院などは電子カルテなどデジタル化が進んでいますが、歯科医院は個人経営が多いため、アナログなところが多いです。<br>
患者様から電話、来院予約があった際、カルテを探すのに時間がかかり待たせてしまったり、<br>
情報共有するのに時間がかかってしまったり、<br>
治療内容を一つ一つ手書きで書くのも大変でした。<br>
そんな現状を変えたく、登録するだけで<br>
パソコン一つで簡単にDr、歯科衛生士、歯科助手全ての業種が情報を共有でき、<br>
カルテを探すタイムロスが減るこのアプリを考えました。

## 開発環境

M1 mac<br>
Ruby 3.0.3<br>
Ruby on Rails 6.1.4<br>
SQLite３<br>
AWS<br>
Rspec<br>
Rubocop<br>
docker

## 機能

出来るだけシンプルにわかりやすく、必要最低限の機能をつけました。<br>

ユーザー登録/ログイン機能（パスワードも変更できるよう実装）<br>
検索機能（名前は曖昧検索/電話番号カルテ番号は完全一致検索で実装）<br>
患者登録機能（編集/削除/詳細）<br>
コメント機能/削除（追加でコメント残せるように実装）<br>
bookmark機能（予約時に注意が必要な患者をブックマークをしておくことで一覧ですぐ確認できるように実装）<br>
ページネーション機能

## ER図
<img width="743" alt="スクリーンショット 2022-07-11 15 43 06" src="https://user-images.githubusercontent.com/93603572/178287726-731d9c73-c1c7-484d-b228-3f0819905305.png">


## テスト用アカウント

メールアドレス：test@example.co.jp<br>
パスワード：test１１１1<br>


## 　こだわったところ

今回bootstrapを使用せず、cssを自分自身で考えました。<br>
携帯からログインすることはないと考えたのでレスポンシブは行っておりませんが、<br>
全てのブラウザからアプリを使用してもレイアウトの崩れがないようCSSリセットを行い実装しています。<br>
クラス名を考えるのに少々悩んだことが多いかったので、<br>
適切なクラス名を付けれるようになる事が今後の課題です。
