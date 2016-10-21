require_relative 'spec_helper'

describe CssMedia do
  before :all do
    @dir = Pathname(__FILE__).dirname
    @css = @dir.join('app/app/assets/stylesheets/test.css').read
  end

  it "process CSS" do
    expect(CssMedia.process(@css)).to be_a(CssMedia::Result)
  end

  it "process CSS correctly" do
    css = "a {\n    tab-size: 2\n}"
    result = CssMedia.process(css, browsers: ['opera 12'])
    expect(result.css).to eq "#{css}\n// yay\n"
  end

  context 'Sprockets' do
    before :each do
      @assets = Sprockets::Environment.new
      @assets.append_path(@dir.join('app/app/assets/stylesheets'))
      CssMedia.install(@assets, browsers: ['chrome 25'])
    end

    it "integrates with Sprockets" do
      css = @assets['test.css'].to_s
      expect(css).to eq "a {\n" +
                        "    mask: none\n" +
                        "}\n\n// yay\n"
    end

    it "supports disabling" do
      CssMedia.uninstall(@assets)
      css = @assets['test.css'].to_s
      expect(css).to eq "a {\n" +
                        "    mask: none\n" +
                        "}\n"
    end

  end
end
