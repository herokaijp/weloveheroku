require 'spec_helper'
describe "Sites" do
  describe 'サイト一覧画面へアクセスする' do
    let!(:site) { FactoryGirl.create(:site) }
    before do
      visit sites_path
    end
    it '画面が表示されること' do
      page.should have_content('Site list')
    end

    it '登録されたサイトが表示されること' do
      within('ul.sites') do
        page.should have_content(site.name)
      end
    end

    describe '詳細画面へアクセス' do
      before do
        click_on(site.name)
      end

      it '詳細画面へ移動すること' do
        page.current_path.should eq site_path(site)
      end
    end
  end

  describe 'サイト登録画面へアクセスする' do
    before do
      visit new_site_path
    end
    
    it '画面が表示されること' do
      page.should have_content('New site')
    end

    describe '登録する' do
      let(:new_site) { FactoryGirl.build(:site) }
      let(:created_site) { Site.last }
      before do
        find('#site_name').set(new_site.name)
        find('form#new_site input[type=submit]').click()
      end
      
      it '登録完了画面へ遷移すること' do
        current_path.should eq site_path(created_site.id)
      end

      it '登録完了メッセージに登録したサイトの名前が含まれること' do
        page.should have_content("#{new_site.name}")
      end

      it '登録完了メッセージが表示されること' do
        page.should have_content('登録が完了しました')
      end
      
    end
  end
end
