# encoding: utf-8

require 'spec_helper'

describe Rsvp do

  it { should respond_to :going }
  it { should respond_to :event_id }
  it { should respond_to :user_id }

end
