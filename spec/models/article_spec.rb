require "spec_helper"

describe Article do
	describe 'validations' do
		it { should validate_presence_of :title	}
		it { should validate_presence_of :text	}
	end

	describe 'associations' do
		it { should have_many :comments	}
		it { should belong_to :user	}
	end

	describe '#subject' do
		it 'returns the title' do
		#создаем объект
		article = create(:article, title:"Lorem")
		#assert, проверка
		expect(article.subject).to eq 'Lorem'
	end
	end

	describe '#last_comment' do
		it 'returns the last comment' do
		end
	end



end