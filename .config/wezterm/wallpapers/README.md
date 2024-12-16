

(画像をダウンロードするURL)[ https://booth.pm/ja/items/4628531 ]

# 注意事項
- `dotfiles/`が`HOME/`の直下にないと動作しない (`.config/westerm/background.lua`でフォルダを指定しているのでそこを編集すれば動作する)

# 手順
- URLをブラウザとかで開いて「猫使ビィ単体」を`download/`フォルダにダウンロードする
- zipを展開
- pythonの環境を作る
'''
python3 -m venv ./venv
source ./venv/bin/activate
pip3 install Pillow
'''
- `wallpapers/`フォルダから`script.sh`を実行





