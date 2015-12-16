@editmeals
Feature: Edit meals

  As a user
  I want to create and edit meals
  So that I can easily know how to cook tonight's dinner

  @focus
  Scenario: Do not show the edit buttons by default
    Given I am a logged in user on the main page
    Then The edit controls should not show

  @focus
  Scenario: When I click on the name of a meal it should open the edit meal view
    Given I am a logged in user on the main page
    And I have added a meal for tonight
    When I click "today"'s meal
    Then The "Name" edit control should show
    And The "Source" edit control should show
    And The "Time" edit control should show
    And The "Ingredients" edit control should show
    And The "Steps" edit control should show

  @focus
  Scenario: When I click on the name of a meal the name of that meal should be shown in the edit
  meal view
    Given I am a logged in user on the main page
    And I have added "Korv Stroganoff" for tonight
    When I click "today"'s meal
    Then The text of the "Name" textbox should be "Korv Stroganoff"

  # getValue always strips spaces, so I cannot verify this. Perhaps with jQuery, but I do not know
  # how to use that in these tests
  @ignore
  Scenario: Remove leading and trailing whitespace in meal names
    Given I am a logged in user on the main page
    And I have added "    Korv Stroganoff  " for tonight
    When I click "today"'s meal
    Then The text of the "Name" textbox should be "Korv Stroganoff"

  @focus
  Scenario: When a meal name that is not in the database has been created for tonight, it should be
  colored red
    Given I am a logged in user on the main page
    And I have added a meal for tonight
    Then The color of tonight's meal should be "#ba0000"

  @focus
  Scenario: When I cancel an edit it should hide the edit controls again
    Given I am a logged in user on the main page in edit mode
    When I click the "cancel" edit meal button
    Then The edit controls should not show

  @focus
  Scenario: When I insert a new row in one of the edit fields the textarea should expand
  automatically
    Given I am a logged in user on the main page in edit mode
    And The "Source" textarea has a certain height
    When I click the "Source" textarea
    And I press "Enter"
    Then The "Source" textarea has increased in height

  @focus
  Scenario: If I have inserted a double row in an edit field and then close and reopen the
    editMeal dialog, the double row should persist
    Given I am a logged in user on the main page in edit mode
    And The "Ingredients" textarea has a certain height
    When I click the "Ingredients" textarea
    And I press "Enter"
    And I click the "ok" edit meal button
    And I click "today"'s meal
    Then The "Ingredients" textarea has increased in height

  @focus
  Scenario: If I have inserted a double row in an edit field and switch to another edit dialog
  and back again, the double row should persist
    Given I am a logged in user on the main page that has inserted a meal into the database
    When I insert "Fiskpudding" as "tomorrow"'s meal
    And I click "tomorrow"'s meal
    And I click the "Ingredients" textarea
    And I press "Enter"
    And I click the "ok" edit meal button
    And I click "today"'s meal
    And The "Ingredients" textarea has a certain height
    And I click the "cancel" edit meal button
    And I click "tomorrow"'s meal
    Then The "Ingredients" textarea has increased in height

  @focus
  Scenario: Adding a new meal to the database should change the color of the link to blue
    Given I am a logged in user on the main page that has inserted a meal into the database
    Then The color of tonight's meal should be "#0645ad"

  @focus
  Scenario: When adding a property to a meal in the database, that property should persist 
  when reloading the page and clicking the edit button again
    Given I am a logged in user on the main page in edit mode
    When I enter "30 min" in the "Time" field
    And I select "2" servings
    And I click the first rating button
    And I enter "Soppa" in the selectize field
    And I click the "ok" edit meal button
    And I refresh the page
    And I wait until I have been logged in
    And I click "today"'s meal
    Then The text of the "Time" textbox should be "30 min"
    And "2" servings should be selected
    And The first rating button should be pressed
    And The selectize field should contain an entry "Soppa"

  @ignore
  Scenario: When clicking a recipe with an empty field after clicking a recipe with some
  filled-in fields, all the empty fields should be shown as empty
    Given I am a logged in user on the main page that has inserted a meal into the database
    When I insert "meal name" as "tomorrow"'s meal
    And I click "tomorrow"'s meal
    And I enter "A very long string that almost certainly causes a row break" in the Time field
    And I click the "ok" edit meal button
    And I click "today"'s meal
    Then The text of the "Time" textbox should be ""

  @ignore
  Scenario: When filling in a field and then switching recipe without saving, the field should be
  cleared
    Given I am a logged in user on the main page in edit mode
    When I enter "30 min" in the "Time" field
    And I insert "meal name" as "tomorrow"'s meal
    And I click "tomorrow"'s meal
    Then The text of the "Time" textbox should be ""
