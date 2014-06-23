# PMCommandGestureRecognizer
## 概要
スーパーファミコン風の隠しコマンドを実現するためのライブラリです。
方向キーは上下左右方向のスワイプ、ABXYLRボタンはタップで入力します。
例えば、Aボタンを入力するにはViewの右半分の領域をタップ、Lボタンを入力するにはViewの左半分かつ上半分の領域をタップします。

## 使い方
CommandGestureRecognizerフォルダ内のファイルをコピーしてください。

    PMKonamiGestureRecognizer *recognizer = [[PMKonamiGestureRecognizer alloc] initWithTarget:self action:@selector(powerup:)];
    [self.view addGestureRecognizer:recognizer];

↑の例だと、↑↑↓↓←→←→BAと入力すれば、powerup:メソッドが呼ばれます。

## オリジナルのコマンドを作成する
PMCommandGestureRecognizerのサブクラスを作り、initWithTarget:action:を上書きしてやることで、
好きなコマンドを作成することができます。
下は、PMKakarotGestureRecognizerの実装です。

    - (id)initWithTarget:(id)target action:(SEL)action {
        return [super initWithTarget:target
                              action:action
                            commands:@[PMCommandUp,
                                       PMCommandX,
                                       PMCommandDown,
                                       PMCommandB,
                                       PMCommandL,
                                       PMCommandY,
                                       PMCommandR,
                                       PMCommandA]];
    }

## 注意点
隠し機能を実装したiOSアプリはリジェクトされる可能性があります。

## ライセンス
MITライセンス
