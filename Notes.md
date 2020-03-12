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
In_grocery :boolean
Has_many teas


Tea
----
Belongs_to brand
Belongs_to User
Quality of Leaves
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
