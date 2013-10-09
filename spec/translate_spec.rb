require 'spec_helper'
describe Baidu::Translate do
  bt = Baidu::Translate.new(BAIDU_TRANSLATE_KEY)
  it "should translate 'hello' to '您好'" do
    bt.translate('hello','en','zh').should == ['您好']
  end
  it "should translate '您好' into 'Hello'" do
    bt.translate('hello','zh','en').should == ['Hello']
  end
end
describe Baidu::Translate do
  it "should translate 'hello' to '您好'" do
    bt = Baidu::Translate.new(BAIDU_TRANSLATE_KEY,'en','zh')
    bt.translate('hello').should == ['您好']
  end
  it "should translate '您好' into 'Hello'" do
    bt = Baidu::Translate.new(BAIDU_TRANSLATE_KEY,'zh','en')
    bt.translate('您好').should == ['Hello']
  end
end
describe Baidu::Translate do
  bt = Baidu::Translate.new(BAIDU_TRANSLATE_KEY,'zh','en')
  it "should cover translating options" do
    bt.translate('hello','en','zh').should == ['您好']
  end
end
