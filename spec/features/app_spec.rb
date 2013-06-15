# coding:utf-8
require 'spec_helper'

describe "Application" do
  context 'トップページにアクセスする' do
    before do
      visit '/'
    end

    it 'コンテンツが表示されること' do
      page.should have_content('Site list')
    end
  end
end
