require "rails_helper"

describe "user sees all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit '/articles'

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_2.title)

      expect(page).to have_link(article_1.title)

      expect(page).to have_link("Create a New Article")
    end
  end
end

describe "user sees on article" do
  describe "they link the articles index" do
    it "displays information for one article" do

      article = Article.create!(title: "New Title", body: "New Body")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end