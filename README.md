# NetworkingApp

I made Item entity for fetched data, NetworkingRequest to execute networking and then TableViewController to display fetched items, but was not able to finish TableViewController so for that there is no view displaying items.

I would have made Cell xib file to display fetched items, but was too late because spend too much time on building NetworkRequest. Even though I would choose MVVM pattern, I know for this kind of small app would have been made it too overloading, so I didn't. But I really wanted to keep everything to have just one responsibility, so separated resource url and network request in a different objects.

For fetching I choose Apples API URLSession not to relay on 3rd party APIs because then code do not depend on other person's ability to update thier library and makes code maintaince easier. 
