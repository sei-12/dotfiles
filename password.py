#!python3
import hashlib
import base64

"""
バックアップを保存しているアカウントのパスワード
"""

m_password = input("パスワード:")
a = input("生年月日は？(8桁の数字で入力): ")
b = input("姉の生年月日は？(8桁の数字で入力): ")
d = input("実家のwifiのパスワードは？: ")
f = input("少なくとも13歳頃から20歳頃にかけて使っていたスマホのパスワードは?(6桁): ")

raw = a + b + d + f

dk = hashlib.pbkdf2_hmac(
    'sha256',
    m_password.encode(),
    raw.encode(),
    50000000
)

# 見やすい文字列に変換
password = base64.urlsafe_b64encode(dk).decode()[:24]

print(password)