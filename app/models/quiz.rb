class Quiz < ActiveYaml::Base
  set_root_path "app/models/seeds"
  set_filename "quiz"

  # 問題数
  TOTAL_QUESTIONS = 7
  # kaisei フォントの問題
  KAISEI_QUESTIONS = [ 1, 3, 5 ]
end
