require 'spec_helper'

describe Fabrication::Schematic::Manager do

  subject { Fabrication::Schematic::Manager.new }

  describe "#register" do

    let(:options) { { aliases: ["thing_one", :thing_two] } }

    before(:all) do
      subject.register(:open_struct, options) do
        first_name "Joe"
        last_name { "Schmoe" }
      end
    end

    it "creates a schematic" do
      subject.schematics[:open_struct].should be
    end

    it "has the correct class" do
      subject.schematics[:open_struct].klass.should == OpenStruct
    end

    it "has the attributes" do
      subject.schematics[:open_struct].attributes.size.should == 2
    end

    context "with an alias" do
      it "recognizes the aliases" do
        subject.schematics[:thing_one].should == subject.schematics[:open_struct]
        subject.schematics[:thing_two].should == subject.schematics[:open_struct]
      end
    end

  end

end
