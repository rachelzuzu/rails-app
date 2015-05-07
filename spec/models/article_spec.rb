require 'rails_helper'


RSpec.describe Article, :type => :model do
	# pending:im intending to write a test for this later on
  pending "add some examples to (or delete) #{__FILE__}"

it "creates an article" do
  	article = build(:article)
  	expect(article).to be_instance_of Article
  end

  describe "models" do
  	context "with valid data" do
  		before(:each) do
  			@article = build(:article)
  		end

  		it "should save OK" do
  			expect(@article).to be_valid
  		end

  	end

  	context "with invalid data" do
  		before(:each) do 
  			@article = build(:article, :title => "")
  		end

  		it "should not be accepted" do
  			expect(@article).to be_invalid
  		end
  	end
  end

  describe "#summary" do

  	it "has content that is more than 100 characters" do
  		expect(build(:article).content.length).to be > 100
  	end

  	it "returns 100 characters of the content" do
  		article = build(:article)
  		expect(article.summary).to eq(article.content.first(100))
  	end
  end
end
