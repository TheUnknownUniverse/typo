Feature: Merge articles

  As an administrator
  In order to better organize the blogs
  I want to be able to merge articles
  
Background:
  Given the blog is set up
  And the following articles are in the database:
  | HelloWorld1 | Joe   | Lorem Ipsum   |
  | HelloWorld2 | Joe2  | Lorem2 Ipsum2 |
  And I merge "HelloWorld1" with "HelloWorld2"
  
  Given the following people are in the database:
  #| Login | password  | email | profile           | firstname |
  | Joe     | 12345     | joe   | Blog Publisher    | Joe       |
  | Joe2    | 12345     | joe2  | Blog Publisher    | Joe2      |
  | Mary    | 12345     | mary  | Contributer       | Mary      |
  
Scenario: A non-admin cannot merge articles.
  Given I am not admin
  And I am on the article view
  Then I should not see "Merge Articles"

Scenario: When articles are merged, the merged article should contain the text of both previous articles.
  #Given I am logged into the admin pannel
  #And I am on the new article page
  #When I fill in "article_title" with "Hello World1"
  #And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
  #And I press "Publish"
  #Given I am on the new article page
  #When I fill in "article_title" with "Hello World2"
  #And I fill in "article__body_and_extended_editor" with "Lorem2 Ipsum2"
  #And I press "Publish"
  Given I am logged into the admin panel
  Given I am on the article view page
  And I follow "Hello World1"
  Then I should see "Merge Articles"
  And I should see "Lorem Ipsum"
  And I should see "Lorem2 Ipsum2"

Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article - the one not being merged).
  #Given I am on the Manage artcles page
  #And I select "HelloWorld1"
  #Then I am on the New articel page
  #Given I fill in "merge articles" with "HelloWorld2"
  #And I follow merge
  Given I am on the Manage articles page
  And I click on "HelloWorld1"
  Then I should be on the New article page
  And the author of "HelloWorld1" should be "Joe"

Scenario: When articles are merged, the merged article should have one title (either one of the titles of the original article - the one not being merged).
  Given I am on the Manage articles page
  Then I should see "HelloWorld1"
  And I should not see "HelloWorld2"

Scenario: When articles are merged, I should see the comments of both articles.
  Given I am on the Manage articles page
  And I click on "HelloWorld1"
  Then I should be on the New article page
  And I should see the comments of "HelloWorld1"
  And I should see the comments of "HelloWorld2"
