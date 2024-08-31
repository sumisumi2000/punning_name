class QuizzesController < ApplicationController
  before_action :reset_quiz, only: %i[new]

  def new
    # セッションに問題数を保存
    session[:quiz_count] ||= 0
    session[:quiz_count] += 1

    # 選択肢を設定
    @choices = get_choices
  end

  def create
    # ユーザーが選んだ選択肢から選択肢番号と選択肢の値に分割
    @choice_number, user_choice = params[:user_choice]&.split("-")
    # 正誤判定
    @is_answer_correct = Answer.find_by(name: user_choice)
    # 正解数をカウント
    session[:correct_count] ||= 0
    session[:correct_count] += 1 if @is_answer_correct
    # 次の問題があるか判定
    @has_next_question = session[:quiz_count] < Quiz::TOTAL_QUESTIONS
  end

  def show
    @answers = Answer.all.map(&:name) unless @has_next_question
  end

  def destroy
    # セッションを削除
    reset_session
    # トップページに遷移
    redirect_to root_path, status: :see_other
  end

  private

  # 現在の問題数に対応する選択肢をセット
  # 1 -> 1 ~ 4
  # 2 -> 5 ~ 8
  # 3 -> 9 ~ 12
  # 4 -> 13 ~ 16
  # 5 -> 17 ~ 20
  def get_choices
    Quiz.where(id: (session[:quiz_count] * 4 - 3)..session[:quiz_count] * 4).map(&:name).shuffle
  end

  # クイズが問題上限に達したらセッションをリセット
  def reset_quiz
    session[:quiz_count] ||= 0
    reset_session if session[:quiz_count] >= Quiz::TOTAL_QUESTIONS
  end
end
