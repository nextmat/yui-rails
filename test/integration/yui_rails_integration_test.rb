require 'test_helper'

describe "yui_rails assets integration" do
  it "provides yui.js on the asset pipeline" do
    visit '/assets/yui.js'
    page.text.must_include "function(Y)"
    page.text.must_include  YUI::Rails::YUI_VERSION
  end
  it "provides yui-min.js on the asset pipeline" do
    visit '/assets/yui-min.js'
    page.text.must_include "var YUI=function()"
    page.text.must_include  YUI::Rails::YUI_VERSION
  end
end
