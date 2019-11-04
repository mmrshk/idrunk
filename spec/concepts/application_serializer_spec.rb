# frozen_string_literal: true

RSpec.describe ApplicationSerializer do
  it { expect(described_class.ancestors).to include(FastJsonapi::ObjectSerializer) }
end
