require "spec_helper"

describe Comment do

	describe 'associations' do
		it { should belong_to :article	}
		it { should belong_to :user	}
	end

	describe 'validations' do

		it { should validate_length_of(:body).is_at_most(500) }

	end
end