require 'spec_helper'

class Mock
  include Wechat::Core::Common
end

describe Wechat::Core::Common, type: :module do

  let(:mock) { Mock.new }

  before :each do
  end

  after :each do
  end

  describe '#assert_present!' do

    it 'should raise error if value is nil' do
      expect { mock.assert_present! :param, nil }.to raise_error(ArgumentError, 'The param argument is required.')
    end

    it 'should raise error if value is ""' do
      expect { mock.assert_present! :param, '' }.to raise_error(ArgumentError, 'The param argument is required.')
    end

    it 'should raise error if value is {}' do
      expect { mock.assert_present! :param, {} }.to raise_error(ArgumentError, 'The param argument is required.')
    end

    it 'should raise error if value is []' do
      expect { mock.assert_present! :param, [] }.to raise_error(ArgumentError, 'The param argument is required.')
    end

    it 'should raise error if value is false' do
      expect { mock.assert_present! :param, false }.to raise_error(ArgumentError, 'The param argument is required.')
    end

    it 'should not raise error if value is 0' do
      expect { mock.assert_present! :param, 0 }.not_to raise_error
    end

    it 'should not raise error if value is 1' do
      expect { mock.assert_present! :param, 1 }.not_to raise_error
    end

    it 'should not raise error if value is "value"' do
      expect { mock.assert_present! :param, 'value' }.not_to raise_error
    end

    it 'should not raise error if value is { key: :value }' do
      expect { mock.assert_present! :param, { key: :value } }.not_to raise_error
    end

    it 'should not raise error if value is [ 3 ]' do
      expect { mock.assert_present! :param, [ 3 ] }.not_to raise_error
    end

    it 'should not raise error if value is true' do
      expect { mock.assert_present! :param, true }.not_to raise_error
    end

    it 'should not raise error if value is Time.now' do
      expect { mock.assert_present! :param, Time.now }.not_to raise_error
    end

    it 'should not raise error if value is :value' do
      expect { mock.assert_present! :param, :value }.not_to raise_error
    end

  end

end
