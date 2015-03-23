# encoding: utf-8
#
# Statistical Analysis of Polling Results (SAPoR)
# Copyright (C) 2014 Filip van Laenen <f.a.vanlaenen@ieee.org>
#
# This file is part of SAPoR.
#
# SAPoR is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# SAPoR is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You can find a copy of the GNU General Public License in /doc/gpl.txt
#

require 'spec_helper'

describe Sapor::CombinationsDistribution, '#new' do
  it 'creates an empty distribution' do
    distribution = Sapor::CombinationsDistribution.new
    expect(distribution).to be_empty
  end
end

describe Sapor::CombinationsDistribution, '#empty?' do
  it 'returns true if no value-combinations pair has been added' do
    distribution = Sapor::CombinationsDistribution.new
    expect(distribution.empty?).to be true
  end

  it 'returns false if a value-combinations pair has been added' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[1] = 2
    expect(distribution.empty?).to be false
  end
end

describe Sapor::CombinationsDistribution, '#[]=' do
  it 'sets a value-combinations pair' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[1] = 2
    expect(distribution[1]).to eq(2)
  end
end

describe Sapor::CombinationsDistribution, '#size' do
  it 'returns 0 for an empty distribution' do
    distribution = Sapor::CombinationsDistribution.new
    expect(distribution.size).to eq(0)
  end

  it 'returns 1 when a value-combinations pair has been added' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[1] = 2
    expect(distribution.size).to eq(1)
  end
end

describe Sapor::CombinationsDistribution, '#values' do
  it 'returns an empty array for an empty distribution' do
    distribution = Sapor::CombinationsDistribution.new
    expect(distribution.values).to eq([])
  end

  it 'returns 1 when a value-combinations pair has been added' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[1] = 2
    expect(distribution.values).to eq([1])
  end
end

describe Sapor::CombinationsDistribution, '#most_probable_value' do
  it "returns the single value if there's only one value" do
    distribution = Sapor::CombinationsDistribution.new
    distribution[1] = 2
    expect(distribution.most_probable_value).to eq(1)
  end

  it 'returns the first of two values if that has the greatest number ' \
     'of combinations' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[1] = 2
    distribution[2] = 1
    expect(distribution.most_probable_value).to eq(1)
  end

  it 'returns the second of two values if that has the greatest number ' \
     'of combinations' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[1] = 1
    distribution[2] = 2
    expect(distribution.most_probable_value).to eq(2)
  end
end

describe Sapor::CombinationsDistribution, '#confidence_interval' do
  it 'returns the single value as boundaries (default)' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[5] = 2
    expect(distribution.confidence_interval(0.95)).to eq([5, 5])
  end

  it 'returns the full interval as boundaries if single value (extensive)' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[5] = 2
    expect(distribution.confidence_interval(0.95, 10)).to eq([0, 10])
  end

  it 'returns the boundaries (default)' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[3] = 2
    distribution[7] = 2
    expect(distribution.confidence_interval(0.95)).to eq([3, 7])
  end

  it 'returns the full interval as boundaries (extensive)' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[3] = 2
    distribution[7] = 2
    expect(distribution.confidence_interval(0.95, 10)).to eq([0, 10])
  end

  it 'returns the full interval if level too high' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[5] = 1
    distribution[10] = 98
    distribution[15] = 1
    expect(distribution.confidence_interval(0.99)).to eq([5, 15])
  end

  it 'returns the values in between as boundaries (even)' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[5] = 1
    distribution[10] = 98
    distribution[15] = 1
    expect(distribution.confidence_interval(0.95)).to eq([8, 12])
  end

  it 'returns the values in between as boundaries (odd)' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[6] = 1
    distribution[10] = 98
    distribution[14] = 1
    expect(distribution.confidence_interval(0.95)).to eq([8, 12])
  end
end

describe Sapor::CombinationsDistribution, '#confidence_interval_values' do
  it 'extracts the single value as confidence interval value' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[5] = 2
    expect(distribution.confidence_interval_values(0.95)).to eq([5])
  end

  it 'extracts all values as confidence intervalue values' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[3] = 2
    distribution[7] = 2
    expect(distribution.confidence_interval_values(0.95).sort).to eq([3, 7])
  end

  it 'extracts the middle values as confidence interval values' do
    distribution = Sapor::CombinationsDistribution.new
    distribution[5] = 1
    distribution[10] = 98
    distribution[15] = 1
    expect(distribution.confidence_interval_values(0.95)).to eq([10])
  end
end