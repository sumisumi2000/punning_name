class QuizzesController < ApplicationController
  before_action :reset_quiz, only: %i[new]

  # 問題数
  QUIZ_NUM = 7
  # kaisei フォントの問題
  KAISEI = [ 1, 3, 5 ]

  def new
    # セッションに問題数を保存
    session[:quiz_count] ||= 0
    session[:quiz_count] += 1

    # 問題に応じてフォントを設定
    @font_name = KAISEI.include?(session[:quiz_count])

    # 選択肢を生成
    # 1 -> 1 ~ 4
    # 2 -> 5 ~ 8
    # 3 -> 9 ~ 12
    # 4 -> 13 ~ 16
    # 5 -> 17 ~ 20
    @choices = Quiz.where(id: (session[:quiz_count] * 4 - 3)..session[:quiz_count] * 4).map(&:name)
  end

  def check
    # 正誤判定
    @is_answer_correct = Answer.find_by(name: params[:name])
    # 正解数をカウント
    session[:correct_count] ||= 0
    session[:correct_count] += 1 if @is_answer_correct
    # 次の問題があるか判定
    @has_next_question = session[:quiz_count] < QUIZ_NUM
  end

  def destroy
    # セッションを削除
    reset_session
    # トップページに遷移
    redirect_to root_path, status: :see_other
  end

  private

  def reset_quiz
    session[:quiz_count] ||= 0
    reset_session if session[:quiz_count] >= QUIZ_NUM
  end
end
