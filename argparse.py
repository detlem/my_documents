import argparse

def get_args():
    parser = argparse.ArgumentParser(
        description='スクリプトの説明を書く'
    )
    parser.add_argument(
        '-i', '--input',
        type=str,
        required=True,
        help='入力ファイルのパス'
    )
    parser.add_argument(
        '-o', '--output',
        type=str,
        default='result.txt',
        help='出力ファイルのパス (デフォルト: result.txt)'
    )
    parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='詳細ログを表示'
    )
    return parser.parse_args()

if __name__ == '__main__':
    args = get_args()
    print(args.input, args.output, args.verbose)
