Facebook Clone

This repo is a Facebook clone, with parameters for the project laid out by TheOdinProject.

Parameters can be found here: https://www.theodinproject.com/lessons/ruby-on-rails-rails-final-project

Project is hosted here: https://protected-cliffs-75013.herokuapp.com/

As of 6/2/22, core functionality has been created. This project is top of list to revisit once self paced coursework is completed and I can turn all my attention to refactoring projects and creating new ones.

Please contact eholdener12@gmail.com for test login information

Takeaways
- Turbo and Devise integration stumped me for a long time, and still does. According to a reddit post made by the Devise maintainer at the end of February, Devise isn't fully integrated with Rails 7 and turbo, which made link_to's with delete or post impossible for me to use. I had to substitute buttons in that case.
- Bootstrap is a great tool and I can see why people in the industry love it - my weakest skill currently is probably CSS and Bootstrap enabled me to build a functioning and pretty website.
- Omniauth is very easy and interesting software - it took me less than an hour to get Facebook login integration created.
- Pseudocoding and planning my entire database schema on a whiteboard beforehand saved me alot of time. I didn't have to generate tons of new migrations to fix my oversights as I went and barely needed to touch my models after initial setup.
- My workflow for this project was as follows: pseudocode out database structure and figure out timeline and parameters, create database and models for relationships, build out web pages
- One thing I would do differently in the future is utilize RSpec more to TDD my webpage. I did alot of testing when I was just working with Ruby, making terminal applications like chess, but once I got to Rails I fell off testing. Manually testing definitely took longer for me than test driven development would have, but it's a learning experience.

Future To-Dos
- Revisit with more Javascript knowledge to make page more responsive
- Keep on the lookout for devise update with turbo integration
- Add turbo and stimulus to create a true SPA
- Figure out how to do image galleries inside of a post, to be able to upload multiple images and scroll through them (probably a JS thing)
- Add ability to put image on comments
- Add liking, disliking, replying, and deleting to comments
- Make comment chains easier to see - show which comment is a child of another
- Refactor code to make more use of models, move alot of logic code to model to fix integration issues
- Troubleshoot Sign in with Facebook option
