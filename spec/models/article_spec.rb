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
		#создаем объект
		article = FactoryGirl.create(:article, title:"Lorem")
		#assert, проверка
		it {expect(article.subject).to eq 'Lorem'}
	end
end