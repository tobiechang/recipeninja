-- Create the recipes database
DROP DATABASE IF EXISTS recipe_ninja_database;
CREATE DATABASE recipe_ninja_database;
USE recipe_ninja_database;
-- create the tables
CREATE TABLE account (
  username VARCHAR(20) NOT NULL UNIQUE,
  pass VARCHAR(20) NOT NULL,
  email VARCHAR(30) NOT NULL UNIQUE,
  firstname VARCHAR(20) NOT NULL,
  lastname VARCHAR(20) NOT NULL,
  aboutme VARCHAR(255),
  PRIMARY KEY (username)
);

CREATE TABLE categories (
  categoryID INT(11) NOT NULL AUTO_INCREMENT,
  categoryName VARCHAR(30) NOT NULL UNIQUE,
  PRIMARY KEY(categoryID)
);

CREATE TABLE recipes (
  recipeID INT(11) NOT NULL AUTO_INCREMENT,
  categoryID INT(11) NOT NULL,
  recipeName VARCHAR(255) NOT NULL,
  recipedescription VARCHAR(500) NOT NULL,
  images VARCHAR(50) NOT NULL,
  PRIMARY KEY (recipeID)
);

CREATE TABLE steps (
  stepID INT(11) NOT NULL AUTO_INCREMENT,
  recipeID INT(11) NOT NULL,
  stepNum  INT(11) NOT NULL,
  info VARCHAR(500) NOT NULL,
  PRIMARY KEY (stepID)
);


CREATE TABLE ingredient (
  ingID INT(11) NOT NULL AUTO_INCREMENT,
  recipeID INT(11) NOT NULL,
  num  INT(11) NOT NULL,
  info VARCHAR(500) NOT NULL,
  PRIMARY KEY (ingID)
);

CREATE TABLE saved (
recipeID INT(11) NOT NULL,
username VARCHAR(20) NOT NULL,
PRIMARY KEY(recipeID, username)

);
alter table saved
add constraint
fk_saved_Recipe foreign key(recipeID) references recipes(recipeID);

alter table saved
add constraint
fk_saved_account foreign key(username) references account(username);

INSERT INTO
  categories
VALUES
  (1, 'Chicken'),
  (2, 'Seafood'),
  (3, 'Beef'),
  (4, 'Vegetarian'),
  (5, 'Appetizers'),
  (6, 'Sides'),
  (7, 'Dessert');
-- Descriptions are pulled from various websites, as well as the images. Instead of uploading the images to the sql table, the table will store the relative paths to recipe corresponding image files in the image folder. The intent is to use this relative path to then display the image in the php pages.
INSERT INTO
  recipes
VALUES
  (
    1,
    1,
    'Garlic Butter Chicken',
    'Butter Chicken is a curry of chicken in a spiced tomato, butter, garlic and cream sauce.',
    'images/recipe_images/garlic_butter_chicken.jpeg'
  ),
  (
    2,
    1,
    'Lemon Chicken',
    'Lemon chicken is the name of several dishes found in cuisines around the world which include chicken and lemon. In Canadian- and British-Chinese cuisine, it usually consists of pieces of chicken meat that are sautéed or battered and deep-fried and coated with a thick, sweet lemon-flavored sauce',
    'images/recipe_images/lemon_chicken.jpeg'
  ),
  (
    3,
    1,
    'Homemade Chicken Nuggets',
    'A chicken nugget is a food product consisting of a small piece of deboned chicken meat that is breaded or battered, then deep-fried or baked.',
    'images/recipe_images/homemade_chicken_nuggets.jpeg'
  ),
  (
    4,
    1,
    'Chicken Parmesan',
    'Chicken parmigiana, or chicken parmesan, is a dish that consists of breaded chicken breast covered in tomato sauce and mozzarella, parmesan, or provolone cheese. A quantity of ham or bacon is sometimes added. The dish originated from 20th-century Italian diaspora.',
    'images/recipe_images/chicken_parmesan.jpeg'
  ),
  (
    5,
    2,
    'Lemon Butter Salmon',
    'This lip-smacking Lemon Butter Salmon makes for an easy, breezy supper to serve family or friends out on the patio some warm night. As an extra-special touch, you might add a 4-ounce package of salad shrimp to the remaining lemon butter, then spoon over the salmon before serving',
    'images/recipe_images/lemon_butter_salmon.jpeg'
  ),
  (
    6,
    2,
    'Grilled Shrimp',
    'When you want a quick, easy dinner, nothing can beat shrimp to the table! The shrimp marinate in a tasty combination of flavors while the grill is preheating. The other dishes in your dinner need to be ready when the grill is, because the shrimp will only take about 4 minutes. Use this grilled shrimp as a main dish, with a side of yellow rice and a green veggie, or use them in yummy shrimp tacos, inside corn tortillas with your favorite toppings.',
    'images/recipe_images/grilled_shrimp.jpeg'
  ),
  (
    7,
    2,
    'Seafood Alfredo Pasta',
    'Creamy Seafood Alfredo is a pasta dish made out of mixed seafood like shrimp, squid and fish cooked in cream served with generous amounts of Parmesan cheese.',
    'images/recipe_images/seafood_alfredo_pasta.jpeg'
  ),
  (
    8,
    3,
    'Classic Beef Tacos',
    'With all of the delicious tacos out there, Classic Beef Tacos are the G.O.A.T. (AKA the greatest of all time!) Ground beef tacos, seasoned with taco seasoning are the tried and true flavor your family craves. Then comes the fun part choosing your favorite toppings to finish off this Classic Beef Tacos Recipe. Serve them up in taco shells, with an ice cold Corona™ Extra and watch them disappear',
    'images/recipe_images/classic_beef_tacos.jpeg'
  ),
  (
    9,
    4,
    'Homemade Veggie Burgers',
    'A veggie burger is a burger patty that does not contain meat. These burgers may be made from ingredients like beans, especially soybeans and tofu, nuts, grains, seeds or fungi such as mushrooms or mycoprotein.',
    'images/recipe_images/homemade_veggie_burgers.jpeg'
  ),
  (
    10,
    5,
    'Buffalo Chicken Dip',
    'Buffalo Chicken Dip is a mixture of chicken breast meat, cheddar cheese, cream cheese, Frank’s Red Hot sauce, and either blue cheese or ranch dressing. It is mixed and baked to recreate the flavors of buffalo wings being dipped in ranch or blue cheese dressing.',
    'images/recipe_images/buffalo_chicken_dip.jpeg'
  ),
  (
    11,
    5,
    'Spinach Artichoke Dip',
    'This spinach artichoke dip is a mix of freshly cooked spinach, artichoke hearts and three types of cheese, all baked to golden brown perfection. A classic party snack that always gets rave reviews from family and friends.',
    'images/recipe_images/spinach_artichoke_dip.jpeg'
  ),
  (
    12,
    6,
    'Twice Baked Potatoes',
    'You don’t have to wait for dinner at a fancy steakhouse to enjoy cheesy, gooey twice baked potatoes. They’re surprisingly easy to make at home. Once assembled, the finished potatoes are super-easy to make ahead and store in the fridge or freezer.',
    'images/recipe_images/twice_baked_potatoes.jpeg'
  ),
  (
    13,
    7,
    'Molten Lava Cake',
    'Molten chocolate cakes — also known as chocolate lava cakes — are rich individual chocolate cakes with oozing molten centers. The original recipe was created by master chef Jean-Georges Vongerichten fortuitously, when he pulled a chocolate cake out of the oven before it was done and discovered the center to be enticingly warm and pudding-like.',
    'images/recipe_images/molten_lava_cake.jpeg'
  );

  INSERT INTO
  steps
  VALUES
  (1, 1, 1, 'To a large skillet, add the olive oil, pounded chicken, evenly season with 21 Salute, salt, pepper, and cook over medium-high heat for 5 minutes. Do not touch, move, or disturb the chicken while it is searing. After 5 minutes, flip chicken over. It should have a medium golden color. For thicker/bigger chicken breasts, sear for 6-7 minutes. '),
  (2, 1, 2, 'Allow chicken to cook on the second side for about 5 minutes, or until done and cooked through. Again, do not disturb the chicken while it is searing.'),
  (3, 1, 3, 'Remove chicken with a slotted spatula and place it on a plate to rest.'),
  (4, 1, 4, 'Using caution, deglaze your skillet by adding wine (or broth) and allow the liquid to bubble up and steam violently for a few seconds.'),
  (5, 1, 5, 'Add the butter and allow it to melt, about 1 minute; stir continuously until melted.'),
  (6, 1, 6, 'Add the garlic and cook until fragrant, about 1 minutes; stir continuously. '),
  (7, 1, 7, 'Turn the heat off, add the chicken back into the skillet, flip it around in the garlic butter sauce, and spoon the sauce over the chicken.'),
  (8, 1, 8, 'Optionally garnish with parsley and serve immediately. '),
  (9, 2, 1, 'Cut the chicken breasts in half lengthwise. Lightly beat with a meat mallet until even in thickness.'),
  (10, 2, 2, 'In a bowl, whisk together the ingredients for the egg mixture. In another bowl, combine the ingredients for the parmesan mixture. Dip chicken into the egg mixture, then dredge chicken in the parmesan mixture. Allow any excess ingredients to fall off from each bowl.'),
  (11, 2, 3, 'In a large skillet, heat enough oil to cover the bottom of a skillet. Once hot, add the chicken and cook 4-5 minutes per side, or until crispy, golden and cooked through to 165˚F on an Instant Read Thermometer. Reduce the heat if chicken browns too quickly.'),
  (12, 2, 4, 'Meanwhile, in a separate saucepan, melt butter and garlic, cook until fragrant. Add the chicken broth, lemon juice and pepper. Allow the sauce to cook for about 2 minutes. Pour the sauce over the cooked chicken, turning to coat. Garnish with lemon slices and finely chopped parsley if desired.'),
  (13, 3, 1, 'To a large skillet, add the olive oil, pounded chicken, evenly season with 21 Salute, salt, pepper, and cook over medium-high heat for 5 minutes. Do not touch, move, or disturb the chicken while it is searing. After 5 minutes, flip chicken over. It should have a medium golden color. For thicker/bigger chicken breasts, sear for 6-7 minutes. '),
  (14, 3, 2, 'Allow chicken to cook on the second side for about 5 minutes, or until done and cooked through. Again, do not disturb the chicken while it is searing.'),
  (15, 3, 3, 'Remove chicken with a slotted spatula and place it on a plate to rest.'),
  (16, 4, 1, 'To a large skillet, add the olive oil, pounded chicken, evenly season with 21 Salute, salt, pepper, and cook over medium-high heat for 5 minutes. Do not touch, move, or disturb the chicken while it is searing. After 5 minutes, flip chicken over. It should have a medium golden color. For thicker/bigger chicken breasts, sear for 6-7 minutes. '),
  (17, 4, 2, 'Allow chicken to cook on the second side for about 5 minutes, or until done and cooked through. Again, do not disturb the chicken while it is searing.'),
  (18, 4, 3, 'Remove chicken with a slotted spatula and place it on a plate to rest.'),
  (19, 4, 4, 'Using caution, deglaze your skillet by adding wine (or broth) and allow the liquid to bubble up and steam violently for a few seconds.'),
  (20, 4, 5, 'Add the butter and allow it to melt, about 1 minute; stir continuously until melted.'),
  (21, 4, 6, 'Add the garlic and cook until fragrant, about 1 minutes; stir continuously. '),
  (22, 4, 7, 'Turn the heat off, add the chicken back into the skillet, flip it around in the garlic butter sauce, and spoon the sauce over the chicken.'),
  (23, 4, 8, 'Optionally garnish with parsley and serve immediately. '),
  (24, 4, 9, 'To a large skillet, add the olive oil, pounded chicken, evenly season with 21 Salute, salt, pepper, and cook over medium-high heat for 5 minutes. Do not touch, move, or disturb the chicken while it is searing. After 5 minutes, flip chicken over. It should have a medium golden color. For thicker/bigger chicken breasts, sear for 6-7 minutes. '),
  (25, 5, 1, 'Position a rack in the middle of the oven. Preheat oven to 375°F | 190°C. Line a baking tray / sheet with a large piece of foil, big enough to fold over and seal to create a packet (or 2 long pieces of foil over lapping each other lengthways to create your salmon packet, depending on the width of you fillet).'),
  (26, 5, 2, 'In a small saucepan, melt the butter over low-medium heat. Add the garlic and cook until fragrant (1 minute). Turn off heat; whisk in the lemon juice and brown sugar.'),
  (27, 5, 3, 'Place the salmon onto lined baking tray | sheet. Season with salt and pepper to taste. Pour the lemon butter over the salmon, and using a spoon, spread evenly over the salmon. Sprinkle with parsley and dill. Arrange lemon slices over the salmon. Fold the sides of the foil over the salmon to cover and completely seal the packet closed.'),
  (28, 5, 4, 'Bake until cooked through (about 12-15 minutes, depending on the thickness of your fish and your preference of doneness). Open the foil, being careful of any escaping steam, and grill / broil under the grill / broiler for 2-3 minutes on medium heat. Garnish with extra parsley if desired and serve immediately.'),
  (29, 6, 1, 'Place the olive oil, lemon juice, salt, pepper, Italian seasoning and garlic in a resealable plastic bag. Seal and shake to combine.'),
  (30, 6, 2, 'Add the shrimp to the bag and seal. Toss to coat evenly with the marinade.'),
  (31, 6, 3, 'Marinate for at least 15 minutes or up to 2 hours. You do not want to marinate for longer than that, as the acid in the lemon juice will start to cook the shrimp.'),
  (32, 6, 4, 'Thread the shrimp onto skewers.  Heat a grill or grill pan over medium high heat.'),
  (33, 6, 5, 'Place the skewers on the grill. Cook for 2-3 minutes on each side or until shrimp are pink and opaque.'),
  (34, 6, 6, 'Broiler directions: Preheat the broiler. Place the shrimp skewers on a sheet pan coated with cooking spray. Broil for 2-3 minutes on each side or until shrimp are pink and opaque.'),
  (35, 6, 7, 'Sprinkle with parsley and serve with lemon wedges.'),
  (36, 7, 1, 'Cook the fettuccine according to package directions. Meanwhile, in a large skillet, saute shrimp and scallops in 1 tablespoon oil for 3-5 minutes or until shrimp turn pink and scallops are opaque. Remove and keep warm. '),
  (37, 7, 2, 'In the same skillet, saute shallot in remaining oil until tender. Add garlic; cook 1 minute longer. Stir in broth and wine. Bring to a boil. Reduce heat; simmer, uncovered, for 6-8 minutes or until most of the liquid has evaporated. Stir in cream; cook, uncovered, over medium heat for 5 minutes or until thickened. '),
  (38, 7, 3, 'Drain fettuccine; stir into cream sauce. Add shrimp, scallops and cheese; toss to coat. Sprinkle with tomato and parsley.'),
  (39, 8, 1, 'Prepare a recipe for homemade taco meat. '),
  (40, 8, 2, 'Chop and shred desired toppings for the tacos and place into bowls. '),
  (41, 8, 3, 'In a skillet heat the soft tortillas. Add the taco meat into the soft tortillas or in hard shells. Top with desired topping and enjoy. '),
  (42, 9, 1, 'Preheat the oven to 400 degrees Fahrenheit. Line a large, rimmed baking sheet with parchment paper for easy clean-up.'),
  (43, 9, 2, 'Roast the sweet potatoes: Slice the sweet potatoes down the center lengthwise. Place the sweet potatoes, cut side down, on the prepared baking sheet. Roast until they yield to a gentle squeeze, 30 to 40 minutes or longer. Set aside for now. (If you’ll be baking the burgers, reserve the parchment-lined pan and leave the oven on.)'),
  (44, 9, 3, 'Meanwhile, in a small saucepan, combine the quinoa and water. Bring the mixture to a boil over medium-high heat, then reduce the heat as necessary to maintain a gentle simmer. Simmer, uncovered, until all of the water is absorbed, 11 to 14 minutes. Remove the pan from the heat, cover, and let the quinoa steam for 10 minutes.'),
  (45, 9, 4, 'Once the sweet potatoes are cool enough to handle, remove and discard the skin (it should pull off easily) and roughly chop the insides. In a large mixing bowl or the bowl of your electric mixer, combine the cooled sweet potatoes and quinoa, black beans, onion, cilantro, garlic, adobo sauce, cumin, chili powder, and salt. Use a potato masher, pastry cutter, large spoon or the paddle attachment of your mixer to mix really well. It’s ok if the black beans get smashed in the process.'),
  (46, 9, 5, 'Sprinkle the oats over the mixture and mix well with a large spoon until the mixture holds together when you shape a portion into a patty. If you won’t be making the burgers immediately, cover the mixture and refrigerate for later.'),
  (47, 9, 6, 'When you’re ready to cook, shape the burgers: Use a measuring cup to measure out ½ cup of the mixture. Gently shape it into a patty about 3 ½ to 4 inches in diameter. Use your hands to gently flatten the burgers and smooth out any jagged edges. Repeat the process for each patty; you should end up with 8.'),
  (48, 9, 7, 'If you’re baking the burgers (see recipe notes for alternate options), brush both sids of each patty generously with olive oil and place them on the lined baking sheet, leaving a few inches of space around each one. Bake at 400 degrees Fahrenheit until the patties are deeply golden on the outside, about 35 minutes, flipping halfway.'),
  (49, 9, 8, 'Serve burgers as desired. Leftover burgers keep well, refrigerated, for 4 days. Or, freeze them in a freezer bag for up to 3 months (thaw in the microwave for about 1 minute or in a 400 degree oven for 12 to 15 minutes, until warmed all the way through).'),
  (50, 10, 1, 'Heat chicken and hot sauce in a skillet over medium heat, until heated through. Stir in cream cheese and ranch dressing. Cook, stirring until well blended and warm. Mix in half of the shredded cheese, and transfer the mixture to a slow cooker. Sprinkle the remaining cheese over the top, cover, and cook on Low setting until hot and bubbly. Serve with celery sticks and crackers.'),
  (51, 11, 1, 'Preheat oven to 350 degrees. Spray a small (4 – 5 cup) baking dish with non-stick cooking spray.'),
  (52, 11, 2, 'In a mixing bowl stir together cream cheese, sour cream, mayonnaise, garlic, parmesan, mozzarella and pepper.'),
  (53, 11, 3, 'Stir in artichokes and spinach.'),
  (54, 11, 4, 'Spread mixture evenly into prepared baking dish.'),
  (55, 11, 5, 'You can make the dip a day in advance then let it rest at room temperature 30 – 60 minutes and bake.'),
  (56, 12, 1, 'Preheat the oven to 400 degrees F. '),
  (57, 12, 2, 'Place the potatoes on a baking sheet. Rub them with the canola oil and bake for 1 hour, making sure they are sufficiently cooked through. '),
  (58, 12, 3, 'Slice the butter into pats. Place in a large mixing bowl and add the bacon bits and sour cream. Remove the potatoes from the oven. Lower the heat to 350 degrees F. '),
  (59, 12, 4, 'With a sharp knife, cut each potato in half lengthwise. Scrape out the insides into the mixing bowl, being careful not to tear the shell. Leave a small rim of potato intact for support. Lay the hollowed out potato shells on a baking sheet. '),
  (60, 12, 5, 'Smash the potatoes into the butter, bacon and sour cream. Add the cheese, milk, seasoned salt, green onions and black pepper to taste and mix together well. (IMPORTANT: If you plan to freeze the twice-baked potatoes, do NOT add the green onions.)'),
  (61, 12, 6, 'Fill the potato shells with the filling. I like to fill the shells so they look abundant and heaping. Top each potato with a little more grated cheese and pop them in the oven until the potato is warmed through, 15 to 20 minutes. '),
  (62, 13, 1, 'To a large skillet, add the olive oil, pounded chicken, evenly season with 21 Salute, salt, pepper, and cook over medium-high heat for 5 minutes. Do not touch, move, or disturb the chicken while it is searing. After 5 minutes, flip chicken over. It should have a medium golden color. For thicker/bigger chicken breasts, sear for 6-7 minutes. '),
  (63, 13, 2, 'Allow chicken to cook on the second side for about 5 minutes, or until done and cooked through. Again, do not disturb the chicken while it is searing.'),
  (64, 13, 3, 'Remove chicken with a slotted spatula and place it on a plate to rest.'),
  (65, 13, 4, 'Using caution, deglaze your skillet by adding wine (or broth) and allow the liquid to bubble up and steam violently for a few seconds.'),
  (66, 13, 5, 'Add the butter and allow it to melt, about 1 minute; stir continuously until melted.'),
  (67, 13, 6, 'Add the garlic and cook until fragrant, about 1 minutes; stir continuously. '),
  (68, 13, 7, 'Turn the heat off, add the chicken back into the skillet, flip it around in the garlic butter sauce, and spoon the sauce over the chicken.');


INSERT INTO
  ingredient
VALUES
  (1, 1, 1, 'Olive oil'),
  (2, 1, 2, 'Boneless skinless chicken breasts'),
  (3, 1, 3, '21 Salute Seasoning (or poultry seasoning)'),
  (4, 1, 4, 'Salt'),
  (5, 1, 5, 'Pepper'),
  (6, 1, 6, 'White wine or chicken broth'),
  (7, 1, 7, 'Butter'),
  (8, 1, 8, 'Garlic'),
  (9, 1, 9, 'Fresh parsley, optional'),
  (10, 2, 1, '1/4 cup good olive oil'),
  (11, 2, 2, '3 tablespoons minced garlic (9 cloves)'),
  (12, 2, 3, '1/3 cup dry white wine'),
  (13, 2, 4, '1 tablespoon grated lemon zest (2 lemons)'),
  (14, 2, 5, '2 tablespoons freshly squeezed lemon juice'),
  (15, 2, 6, '1 1/2 teaspoons dried oregano'),
  (16, 2, 7, '1 teaspoon minced fresh thyme leaves'),
  (17, 2, 8, 'Salt'),
  (18, 2, 9, ' 4 boneless chicken breasts, skin on (6 to 8 ounces each)'),
  (19, 2, 8, '1 lemon'),
  (20, 3, 1, '1/2 cup all-purpose flour'),
  (21, 3, 2, '1 teaspoon granulated garlic'),
  (22, 3, 3, 'Kosher salt and ground black pepper'),
  (23, 3, 4, '2 boneless skinless chicken breasts, cut into 1 1/2-inch pieces'),
  (24, 3, 5, '1 cup prepared breadcrumbs'),
  (25, 3, 6, '1 large egg'),
  (26, 3, 7, '1 cup vegetable oil'),
  (27, 4, 1, 'Olive oil'),
  (28, 4, 2, 'Boneless skinless chicken breasts'),
  (29, 4, 3, '21 Salute Seasoning (or poultry seasoning)'),
  (30, 4, 4, '4 skinless, boneless chicken breast halves '),
  (31, 4, 5, 'salt and freshly ground black pepper to taste '),
  (32, 4, 6, '2 eggs '),
  (33, 4, 7, '1 cup panko bread crumbs, or more as needed '),
  (34, 4, 8, '1/2 cup grated Parmesan cheese '),
  (35, 4, 9, '1/4 cup fresh mozzarella, cut into small cubes '),
  (36, 5, 1, '1/3 cup butter'),
  (37, 5, 2, '1/4 cup fresh lemon juice (or juice of 1 lemon -- adjust to your tastes)'),
  (38, 5, 3, '5 large cloves garlic crushed'),
  (39, 5, 4, '1 tablespoon brown sugar (optional)'),
  (40, 5, 5, '2 pound (1 kg) side of salmon'),
  (41, 5, 6, 'Sea salt to taste'),
  (42, 5, 7, 'Cracked pepper to taste (optional)'),
  (43, 5, 8, 'Lemon slices'),
  (44, 5, 9, '2 tablespoons fresh chopped parsley divided'),
  (45, 5, 10, '1 teaspoon dried dill'),
  (46, 6, 1, '1 pound large shrimp peeled and deveined (you can either leave tails on or remove them)'),
  (47, 6, 2, '1/4 cup olive oil'),
  (48, 6, 3, '2 tablespoons lemon juice'),
  (49, 6, 4, '3/4 teaspoon salt'),
  (50, 6, 5, '1/4 teaspoon pepper'),
  (51, 6, 6, '1 teaspoon Italian seasoning'),
  (52, 6, 7, '2 teaspoons minced garlic'),
  (53, 6, 8, '1 tablespoon chopped parsley'),
  (54, 6, 9, 'lemon wedges for serving'),
  (55, 7, 1, '4 ounces uncooked fettuccine'),
  (56, 7, 2, '1/4 pound uncooked medium shrimp, peeled and deveined'),
  (57, 7, 3, '1/4 pound sea scallops, halved'),
  (58, 7, 4, '2 tablespoons olive oil, divided'),
  (59, 7, 5, '1 small shallot, chopped'),
  (60, 7, 6, '1 garlic clove, minced'),
  (61, 7, 7, '1/4 cup chicken broth'),
  (62, 7, 8, '1/4 cup white wine or additional chicken broth'),
  (63, 7, 9, '1 cup heavy whipping cream or half-and-half cream'),
  (64, 7, 10, '1/2 cup grated Parmesan cheese'),
  (65, 7, 11, '1 Roma tomato, diced'),
  (66, 7, 12, '2 tablespoons minced fresh parsley'),
  (67, 8, 1, '1 recipe of taco meat'),
  (68, 8, 2, '8 taco shells, hard shells (or 6-inch soft flour tortillas)'),
  (69, 8, 3, 'shredded lettuce'),
  (70, 8, 4, 'diced tomatoes'),
  (71, 8, 5, 'chopped onion'),
  (72, 8, 6, 'shredded cheese'),
  (73, 8, 7, 'sour cream'),
  (74, 9, 1, 'Ripe, juicy sliced tomato'),
  (75, 9, 2, 'Crisp lettuce or fresh sprouts'),
  (76, 9, 3, 'Pickles'),
  (77, 9, 4, 'Sliced cheese'),
  (78, 9, 5, 'Onion, very thinly sliced'),
  (79, 9, 6, 'Avocado or guacamole'),
  (80, 9, 7, 'Ketchup and mustard'),
  (81, 10, 1, '2 (10 ounce) cans chunk chicken, drained '),
  (82, 10, 2, '2 (8 ounce) packages cream cheese, softened '),
  (83, 10, 3, '1 cup Ranch dressing '),
  (84, 10, 4, '3/4 cup pepper sauce (such as Franks Red Hot) '),
  (85, 10, 5, '1 cup shredded Cheddar cheese '),
  (86, 10, 6, '1 bunch celery, cleaned and cut into 4 inch pieces '),
  (87, 10, 7, '1 (8 ounce) box chicken-flavored crackers '),
  (88, 11, 1, 'Cream cheese'),
  (89, 11, 2, 'Sour cream'),
  (90, 11, 3, 'Mayonnaise'),
  (91, 11, 4, 'Garlic'),
  (92, 11, 5, 'Parmesan'),
  (93, 11, 6, 'Mozzarella'),
  (94, 11, 7, 'Pepper'),
  (95, 11, 8, 'Canned artichokes'),
  (96, 11, 9, 'Frozen spinach'),
  (97, 12, 1, '8 baking potatoes, washed'),
  (98, 12, 2, '3 tablespoons canola oil'),
  (99, 12, 3, '2 sticks salted butter'),
  (100, 12, 4, '1 cup bacon bits (fry your own!)'),
  (101, 12, 5, '1 cup sour cream'),
  (102, 12, 6, '1 cup Cheddar or Jack cheese (or a mix of both), plus more for topping'),
  (103, 12, 7, '1 cup whole milk'),
  (104, 12, 8, '2 teaspoons seasoned salt'),
  (105, 12, 9, '3 green onions, sliced'),
  (106, 12, 10, 'Freshly ground black pepper'),
  (107, 13, 1, '6 ounces (170g) high quality semi-sweet chocolate*'),
  (108, 13, 2, '1/2 cup (115g; 1 stick) unsalted butter'),
  (109, 13, 3, '1/4 cup (31g) all-purpose flour (spoon & leveled)'),
  (110, 13, 4, '1/2 cup (60g) confectioners’ sugar'),
  (111, 13, 5, '1/8 teaspoon salt'),
  (112, 13, 6, '2 large eggs'),
  (113, 13, 7, '2 large egg yolks*');
 


-- create the users and grant priveleges to those users
  GRANT
SELECT,
INSERT,
  DELETE,
UPDATE
  ON recipe_ninja_database.* TO mgs_user @localhost IDENTIFIED BY 'pa55word';