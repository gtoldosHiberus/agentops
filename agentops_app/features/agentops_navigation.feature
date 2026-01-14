Feature: AgentOps Console Navigation
  As a user
  I want to navigate between pages in the AgentOps Console
  So that I can access different features (Agents, Context, Run Studio, History)

  Background:
    Given the app is running

  Scenario: HomePage displays welcome message and navigation buttons
    When I see the HomePage
    Then I see text "Welcome to AgentOps Console"
    And I see text "Agents"
    And I see text "Context Base"
    And I see text "Run Studio"
    And I see text "Run History"

  Scenario: Navigate to AgentsPage
    When I navigate to the Agents page
    Then I see the AgentsPage displayed
    And I see the add agents icon

  Scenario: Navigate to ContextBasePage
    When I navigate to the Context Base page
    Then I see the ContextBasePage displayed

  Scenario: Navigate to RunStudioPage
    When I navigate to the Run Studio page
    Then I see the RunStudioPage displayed

  Scenario: Navigate to RunHistoryPage
    When I navigate to the Run History page
    Then I see the RunHistoryPage displayed

  Scenario: App initializes with GoRouter correctly
    When the app initializes with GoRouter
    Then HomePage is displayed as the initial route
    And the navigation structure is ready
