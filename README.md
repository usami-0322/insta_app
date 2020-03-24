# README
実装したこと
Facebook を利用したログインができる
ログイン後に写真をアップロードすることができる
他のユーザーをフォローすることができる
ログイン後はトップページにフォローしているユーザーの写真が時系列順に表示される
ユーザーの個別ページでは、そのユーザーのアップロードした画像のみ一覧で表示される
検索フォームから自由記述で写真を検索することができる

未実装
通知機能

・トップページ（ログイン前）
ランディングページを表示する
Facebookログインのリンクがある（後述）

・ヘッダー（共通）
トップページへのリンク
検索フォーム
自分のページへのリンク
titleを各ページごとにユニークに設定する
Rails tutorialの学びを活かす

・フッター（共通）
写真アップロード画面へのリンクがある
トップページ（ログイン後）
フォローしているユーザーの画像が一覧で表示される
写真をお気に入りに入れることができる
写真にコメントを記入することができる　←コメント欄のみ実装

・ユーザー個別ページ
ヘッダー（共通）が表示される
プロフィール写真が表示される
自分のページの場合
プロフィール編集ページへのリンクがある
自分以外のページの場合
フォローしていない場合
フォローボタンが表示される
フォローボタンをクリックすると、該当ユーザーをフォローし、ボタンのラベルを「フォロー中」に更新する
フォローしている場合
フォロー解除ボタンが表示される
フォロー解除ボタンをクリックすると、該当ユーザーのフォローを解除し、ボタンのラベルを「フォローする」に更新する
これまでに登録した写真の件数が表示される
フォロワーの数が表示される
フォローしているユーザーの数が表示される
自己紹介が表示される
写真をクリックするとモーダルで写真とコメントが表示される

・プロフィール編集ページ
パスワード変更ページへのリンクがある
下記のプロフィールを編集することができる。（※は必須入力）
公開情報
名前（※）
ユーザーネーム（※）
ウェブサイト
自己紹介
非公開情報
メールアドレス
電話番号
性別
アカウントの削除ボタンがあり、クリックすると自分のデータが全て削除される

・パスワード変更ページ
現在のパスワード、新しいパスワード、新しいパスワードの確認入力欄があり、現在のパスワードが正しく、新しいパスワードと新しいパスワードの入力欄が一致する場合にパスワードが更新される。

・写真個別ページ
ユーザーがアップロードした写真が表示される
ユーザーが記入したコメントが一覧で表示される
コメントの入力欄がある

・写真アップロード画面
写真選択ボタンがある
写真アップロードボタンを押すと、ファイルの選択ダイアログが表示され、写真が選択できる
ファイル選択ダイアログでは、png と jpeg しか選択できない
写真アップロードボタンがある
写真アップロードボタンを押すと選択した写真がアップロードされる
写真は正方形に整形される　←正方形だがセンター部分を切り抜いた形になっている
処理完了後、写真個別ページへリダイレクトする

・Facebook ログイン
Facebook でログイン後、ユーザーが存在しなければユーザー登録画面にリダイレクトする

・ユーザー登録画面
フルネーム、ユーザーネーム、パスワードの入力欄がある
利用規約ページへのリンクがある
登録するボタンをクリックすると、ユーザーが作成され、自分のユーザー個別ページにリダイレクトする


・苦労した点
deviseを導入した際、色々と作ってくれる反面自分の思い通りにならず困りました。ただ、このgemを使いこなすことでとても素早くログイン画面が作れるのでとても便利だと感じました。現場では、ログイン周りが一番繊細な作業だと聞いているので今回devise使いこなせたことは大きな成長だと感じています。
チュートリアル深く理解していたわけではなかったので、色々な実装はどれを行うにも苦戦しました。

・学んだ点
調べるという力が大きく伸びました。今回の課題に取り組む前はエラーが起きたり、何かうまく行かない際は逃げていましたが今回の課題によりエラーはどこを確認すれば良いのか、うまくいかない時はこうしたらいいのかなという案が出るようになりました。
チュートリアルで学んだ通りform_forを使いAjax部分にremoteを使っていましたが、form_for,form_tagが非推奨になりform_withが置換デフォルトでAjaxできることを知り、使ってみました。ただ、途中で知tたため入り混じっています。

・自慢したい、相談したい点
投稿した写真が横３列で表示できません。bootstrapのcol-md-4を入れ子で入れることで可能なイメージはつくのですがどこにどのように入れ込めば良いのかわかりません。Qastの中にeachを使う方法を助言されていますがrubyの初歩がわかっていな炒めか、どのように使えば良いのか…もう少しヒントをいただきたいです。

・今後の課題
通知機能の実装。
UI/UXの改善。
テスト実施。