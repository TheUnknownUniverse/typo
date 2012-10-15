Feature: Merge Articles
  As a blog adminstrator
  In order to condense articles that are on the same topic into one topic
  I want to be able to merge two articles of the same topic into one article

  Background
    Given the blog is set up

  Scenario: A non-admin cannot merge articles
    Given I am logged into the non-admin panel
    When I follow
    And I am logged into the admin panel
    