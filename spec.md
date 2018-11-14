# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  > Project has_many Users
  > User has_many projects

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  > Entry belongs_to a Project 
  > Entry belongs_to a User

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  > User has many projects, through: :entries
  > Project has many users, through: :entries

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  > Entry has 4 attributes: date, start/end time, notes

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  **check enough validations are working**
  > User: name, email, pwd
  > Project: name
  > Entries: notes

- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 **working on one for entries**

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  > /users/1/projects 
  > /users/1/entries

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
  > /users/1/projects/new  
  > /users/1/entries/new

- [ ] Include form display of validation errors (form URL e.g. /recipes/new)
  **update to include with forms**

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate
