require 'spec_helper'
describe "Sites" do
  describe 'サイト登録画面へアクセスする' do
    before do
      visit new_site_path
    end
    
    it '画面が表示されること' do
      page.should have_content('New site')
    end
  end
end