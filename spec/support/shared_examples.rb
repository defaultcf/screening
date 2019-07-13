shared_examples "ログイン画面に遷移する" do
  it do
    expect(subject).to redirect_to root_path
  end
end

shared_examples "200が返る" do
  it do
    expect(subject).to have_http_status :ok
  end
end
