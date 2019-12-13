# hoopla-rails-metrics-quiz

## REQUIREMENTS

Your goal is to create a Ruby on Rails application that interacts with the Hoopla API in order todisplay a
list of Metrics and allow their values to be updated.  We only require a functioning app;
no bonus points are given for UX styling beyond basic readability.

This application should include:
* Landing page will display the list of configured metrics
* Clicking on a metric in the list will take you to a page where metric values are listed
  * __Values are listed for all the users in the organization (even if the user does not have a value set)__
    * In the metric listing page, for users without a value, display a 0 as the value
    * If there is no value, when you click on the user, you should be directed to a page where a new value can be created for that metric and user
  * Values are accompanied by the user's name
  * Only list user values, not team values
* Clicking a user row should take you to another page to edit the metric value. After the value is saved, the user list should be redisplayed, showing the updated value.

## INSTRUCTIONS

Your test account has been set up and populated with users, metrics and their values.  Login and password are provided in an email
along with a skeleton of a rails app to get you past basic authentication, token creation, and URL bootstrapping
1. Login and navigate to the Settings page.  Provision an API Key and make note of theClient ID and Secret.
2. Save the client ID and secret in the .env file provided
3. The Hoopla APIs are documented at ​[Hoopla Developer Hub​](https://developer.hoopla.net). It includes authentication instructions with the Client ID and Secret that are implemented in the HooplaClient helper class.
4. Feel free to modify the HooplaClient helper class to add additional methods as necessary.
5. Generate the appropriate models, views and controllers for the above requirements.
6. Share the link to your Github repo.  Alternatively, zip up your entire Rails project and send to ​christine@hoopla.net

## Solution Notes

A development instance of the application is run from within a docker image and therefore has no software installation dependencies on the host os other than docker itself.

* Ruby version
  * 2.6.5

* System dependencies
  * bash shell
  * git ( https://git-scm.com/downloads )
  * docker ( https://hub.docker.com/?overlay=onboarding )

* Build application docker image
  * git clone git@github.com:aktfrikshun/hoopla-rails-metrics-quiz-master.git
  * cd hoopla-rails-metrics-quiz-master
  * scripts/build.bash

* How to run the test suite
  * scripts/run-tests.bash
  * __Note__:  The test suite is executed on every commit and push.  These operations will not be permitted unless all test cases pass.

* Open bash shell within docker image
  * scripts/run-shell.bash

* Open rails console
  * scripts/run-console.bash

* Run locally
  * scripts/run-local.bash
    * open a webbrowser and enter url http://localhost:3000

* Deployment instructions
  * Simply commit to master branch and AWS Code Pipeline will deploy to the AWS Elastic Beanstalk

