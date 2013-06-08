require 'spec_helper'

describe Site do
  let(:site) { FactoryGirl.create(:site) }
  
  describe 'Siteが生成できる' do
    subject { site }
    it { subject.should be_instance_of Site }
  end
end
