import os
import sys
from PIL import Image

def crop_image(image_path, x, y, w, h, outdir):
    try:
        # 画像を開く
        with Image.open(image_path) as img:
            # 指定された範囲で切り抜き
            cropped_img = img.crop((x, y, x + w, y + h))

            # 出力ディレクトリを作成（存在しない場合）
            os.makedirs(outdir, exist_ok=True)

            # 入力ファイル名を取得して出力パスを生成
            filename = os.path.basename(image_path)
            output_path = os.path.join(outdir, filename)

            # 切り抜いた画像を保存
            cropped_img.save(output_path)
            print(f"Cropped image saved to {output_path}")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    # 引数を取得
    if len(sys.argv) != 7:
        print("Usage: python script.py <image_path> <x> <y> <w> <h> <outdir>")
        sys.exit(1)

    image_path = sys.argv[1]
    x = int(sys.argv[2])
    y = int(sys.argv[3])
    w = int(sys.argv[4])
    h = int(sys.argv[5])
    outdir = sys.argv[6]

    crop_image(image_path, x, y, w, h, outdir)
