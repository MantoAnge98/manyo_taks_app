# App Name : Manyo Task 

## Databse Name : manyo_task_ap

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