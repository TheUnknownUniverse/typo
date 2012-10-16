Feature: Merge articles

  As an administrator
  In order to better organize the blogs
  I want to be able to two merge articles
  
Background:
  Given the blog is set up
  
Scenario: A non-admin cannot merge articles.
  Given I am logged into the non-admin panel
  And I am on the article view
  Then I should not see "Merge Articles"

Scenario: When articles are merged, the merged article should contain the text of both previous articles.
  Given I am logged into the admin pannel
  And I am on the new article page
  When I fill in "article_title" with "Hello World1"
  And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
  And I press "Publish"
  Given I am on the new article page
  When I fill in "article_title" with "Hello World2"
  And I fill in "article__body_and_extended_editor" with "Lorem2 Ipsum2"
  And I press "Publish"
  Given I am on the article view page
  And I follow "Hello World2"
  Then I should see "Merge Articles"
  

Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article).

Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.

Scenario: The title of the new article should be the title from either one of the merged articles.


