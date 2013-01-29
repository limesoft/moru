# encoding: utf-8

require 'spec_helper'

describe Topic do

  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :user_id }
  it { should respond_to :speaker_id }
  it { should respond_to :event_id }

end
