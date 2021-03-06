# encoding: utf-8

require 'spec_helper'

describe Event do

  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :latitude }
  it { should respond_to :longitude }
  it { should respond_to :date }
  it { should respond_to :comments_count }

  it "#title not be empty" do
    Fabricate.build(:event, title: nil).should_not be_valid
  end

  it "#content not be empty" do
    Fabricate.build(:event, content: nil).should_not be_valid
  end

end
