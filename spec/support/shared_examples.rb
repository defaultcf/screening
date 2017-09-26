shared_examples "ログイン画面に遷移する" do
  it do
    is_expected.to redirect_to new_user_session_path
  end
end
