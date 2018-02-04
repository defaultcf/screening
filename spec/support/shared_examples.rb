shared_examples "ログイン画面に遷移する" do
  it do
    is_expected.to redirect_to root_path
  end
end

shared_examples "200が返る" do
  it do
    is_expected.to have_http_status 200
  end
end
