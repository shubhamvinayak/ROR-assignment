Feature: Json API

Scenario: Posts Index actions
When I send a GET request to posts
Then the JSON response should have 100 "post"