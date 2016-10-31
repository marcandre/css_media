require_relative 'spec_helper'

def expect_css_to_be like
  expect(response).to be_success
  clear_css = response.body.gsub("\n", " ").squeeze(" ").strip
  expect(clear_css).to eq like
end

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

  it "integrates with Rails and Sass, leaving alone CSS when filename is not a match" do
    test_file 'sass'
    expect_css_to_be "a.loaded { mask: none } @media (min-width: 550px) { a.with_media { display: none } }"
  end

  it "returns only media rules if filename contains 'media-only'" do
    test_file 'sass-media-only'
    expect_css_to_be "@media (min-width: 550px) { a.with_media { display: none } }"
  end

  it "returns only non-media rules if filename contains 'no-media'" do
    test_file 'sass_no_media'
    expect_css_to_be "a.loaded { mask: none }"
  end

  it "integrates with Rails and plain CSS" do
    test_file 'test'
    expect_css_to_be "a.test { mask: none }"
  end

  it "returns only desired rules if comments include 'css_media: no-media'" do
    test_file 'test_with_comment'
    expect_css_to_be "/* css_media: media-only */ @media (min-width: 550px) { a.with_media { display: none } }"
  end
end
