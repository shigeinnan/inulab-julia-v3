# 例として簡単なLPを実装して解かせるプログラム
# 使用するライブラリの宣言(JuMP:モデリングのライブラリ, HiGHS:単体法のライブラリ)
using JuMP, HiGHS

# 最適化問題の宣言
model = Model(HiGHS.Optimizer)

# 変数の定義
@variable(model, x[1:2] >= 0)

# 目的関数の設定
@objective(model, Min, 50 * x[1] + 80 * x[2])

# 制約条件の設定
@constraint(model, c1, 3 * x[1] >= 6)
@constraint(model, c2, 2 * x[1] + 4 * x[2] >= 10)
@constraint(model, c3, 2 * x[1] + 5 * x[2] >= 8)

# 最適化問題を出力
print(model)

# 最適化の実行
optimize!(model)

# 結果の出力
@show termination_status(model)
@show objective_value(model)
@show value(x[1]), value(x[2])

