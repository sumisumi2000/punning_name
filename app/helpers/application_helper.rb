module ApplicationHelper
  # 正解数に応じてお祝いの言葉を作成
  def generate_congratulations
    case session[:correct_count]
    when 1
      "いいスタートですね！次も頑張ってください！"
    when 2
      "いい調子ですね！さらに進んでいきましょう！"
    when 3
      "順調ですね！この調子でいきましょう！"
    when 4
      "パーフェクトが見えてきましたね！もう少しです！"
    when 5
      "素晴らしいです！パーフェクトまでもう直ぐです！"
    when 6
      "あと一歩で満点です！最後のひと踏ん張りです！"
    when 7
      "全ての問題を正解しました！最高のパフォーマンスです！"
    end
  end

  # kaisei フォントを使用するかどうかを判定
  def use_kaisei_font?(num)
    Quiz::KAISEI_QUESTIONS.include?(num)
  end
end
