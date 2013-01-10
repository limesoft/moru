require 'spec_helper'

describe Post do

  it { should respond_to :title }
  it { should respond_to :content }
  it { should respond_to :comments_count }
  it { should respond_to :user_id }
  it { should respond_to :created_at }

end
