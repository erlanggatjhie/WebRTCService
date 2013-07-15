require 'spec_helper'

describe Room do
  it { should respond_to(:offerer_sdp) }
  it { should respond_to(:answerer_sdp) }
end
