# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    Event has_many Vendors

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    Vendor belongs_to Event

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    Client has_many Events through Reservations
    Event has_many Clients through Reservations

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    (Same as above?)

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Check the Models for validations

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Reservations Index uses .order_by_start_time scope method

- [x] Include signup (how e.g. Devise)

- [x] Include login (how e.g. Devise)

- [x] Include logout (how e.g. Devise)

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    /clients/1/reservations & /events/1/vendors

- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    events/1/vendors/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
