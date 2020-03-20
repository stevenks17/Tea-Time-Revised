User
----
Username
Password
Email?
has_many reviews
has_many teas through reviews


Brand
----
Name
In_stores :boolean
Has_many teas


Tea
----
Belongs_to brand
Belongs_to User
Flavor
Description
Has_many Reviews
Has_many users, through reviews







Reviews
----
Tea_id
User_id
Title
content
Rating (0/10)



To Do List:

Error Handling
Create a link_to new review inside nested route
