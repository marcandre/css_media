require_relative 'spec_helper'

describe CssController, type: :controller do
  before :all do
    cache = Rails.root.join('tmp/cache')
    cache.rmtree if cache.exist?
  end

  def test_file(file)
    if Rails.version.split('.').first.to_i >= 5
      get :test, params: { file: file }
    else
      get :test, file: file
    end
  end

  it "integrates with Rails and Sass" do
    test_file 'sass'
    expect(response).to be_success
    clear_css = response.body.gsub("\n", " ").squeeze(" ").strip
    expect(clear_css).to eq "a.loaded { mask: none } // yay"
  end

  it "integrates with Rails and plain CSS" do
    test_file 'test'
    expect(response).to be_success
    clear_css = response.body.gsub("\n", " ").squeeze(" ").strip
    expect(clear_css).to eq "a.test { mask: none } // yay"
  end
end
