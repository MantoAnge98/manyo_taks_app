# App Name : Manyo Task 

## Databse Name : manyo_task_app

### Name to table 1 :  label

Columnn Name | Column Type
------------ | -------------
id_label     | int
label_name   | string

### Name to table 2 :  tasks

Columnn Name  | Column Type
------------- | -------------
id_tasks      | int
tasks_name    | string
tasks_details | text
date_start    | date
date_end      | date
tasks_priority| int
tasks_statuts | int
id_label      | int
id_user       | int


### Name to table 3 :  user

Columnn Name   | Column Type
-------------- | -------------
id_user        | int
user_name      | string
user_email     | string
user_image     | text
password_digest| string

# Deployment steps for Heroku

## Commit.
git commit -m "Example commit message"

## Create a new application in Heroku
$ do a heroku create
The URLs are different every time.

## Add a Heroku buildpack
Heroku buildpack is a way to compile your application on Heroku.
Basically, Heroku automatically detects and installs the buildpack according to the development language of the source code. But if that's not enough, or if you need an additional buildpack, you can use
You can add the buildpack by running the following command
- $ heroku buildpacks:set heroku/ruby
- $ heroku buildpacks:add --index 1 heroku/nodejs

## Deploy to Heroku
 $ git push heroku master

## Migration to the database
The creation of the Heroku database is automatic, but the migration (table creation) needs to be done manually.
$ heroku run rails db:migrate

## Accessing the application
The address of the Heroku app is set to https://app.herokuapp.com/
Access.
=======
The address of the Heroku app is set to https://appname.herokuapp.com/
Access.

