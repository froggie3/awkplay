# AWKの習作

AWK the programming language


## 大量の整数を出力するやつ

```sh
./anybloat.awk n
```

`n` 個ランダムな数を出力します


## 約数を計算するやつ（入力に柔軟に対応！）

`logging.awk` をログ用ライブラリとして使用します

```sh
./divisor.awk -f logging.awk
```

```sh
seq 9 12 | ./divisor.awk -f logging.awk
9: 1 3 9
10: 1 2 5 10
11: 1 11
12: 1 2 3 4 6 12
```

```
# 承久の乱
./divisor.awk -f logging.awk 12 21
12: 1 2 3 4 6 12
21: 1 3 7 21
```

```
# 途中で - が来ると入力を促します
./divisor.awk -f logging.awk 31 - 12
31: 1 31
64
64: 1 2 4 8 16 32 64
12: 1 2 3 4 6 12
```

## 日付を列挙するやつ

Cosense の日記用

seq を使ってあげてください

```sh
seq -1 365 | ./enumedate.awk -f logging.awk -f deque.awk
2025-01-01
[2024-12-31]
[2025-01-01]

2025-01-02
[2025-01-01]
[2025-01-02]

2025-01-03
[2025-01-02]
[2025-01-03]
...
```
