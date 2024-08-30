class QuizzesController < ApplicationController
  before_action :set_teams, only: %i[new]

  # 問題数
  QUIZ_NUM = 5

  def new
    # 1 ~ 20 の中からランダムな数を生成
    team_id = (1..20).to_a.sample
    # JOne テーブルから無作為にチームを１つ選択
    team = JOne.find team_id

    # 選択肢を生成
    @choices = [ team.name, team.name.sub("ド", "ト"), team.name.sub("ー", "一"), team.name.sub("ガ", "カ") ]

    # セッションに選択肢のチームを保存
    session[:used_team_ids] ||= []
    session[:used_team_ids] << team.id
    # セッションに問題数を保存
    session[:quiz_count] ||= 0
    session[:quiz_count] += 1
  end

  def check
    p JOne.find(session[:used_team_ids].last)
    # 正誤判定
    @is_answer_correct = params[:name] == JOne.find(session[:used_team_ids].last).name

    # 次の問題があるか判定
    @has_next_question = session[:quiz_count] < 5
  end

  def destroy
    # セッションを削除
    reset_session
    # トップページに遷移
    redirect_to root_path, status: :see_other
  end

  private
  def set_teams
    # 1問目の場合は配列が空なので終了
    return if session[:used_team_ids].nil?
    # 選択可能なチームの配列を格納するセッションが未作成なら、作成
    session[:available_team_ids] ||= (1..20).to_a
    # 選択可能なチームから使用済みのチームの id を削除
    session[:available_team_ids] = session[:available_team_ids].difference(session[:used_team_ids])
  end
end
