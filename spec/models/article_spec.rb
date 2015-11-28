require "spec_helper"

describe Article do
	describe 'validations' do
		it { should validate_presence_of :title	}
		it { should validate_presence_of :text	}

		it { should validate_length_of(:text).is_at_most(2000) }

		it do
    		should validate_length_of(:title).
      		is_at_least(2).is_at_most(40)
  		end

		

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
			article = create(:article_with_comments)
			expect(article.last_comment.body).to eq 'comments body 3'
		end
	end



end