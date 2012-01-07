+++++++++++++++++++++++++++++++++++++++++++++++
+                                             +
+  Fachhochschule Salzburg                    +
+  University of Applied Sciences             +
+                                             +
+  Major: MultiMedia Technology               +
+  Specialization: Web & Communities          +
+                                             +
+  Wintersemester 2011                        +
+  QPT 2a                                     +
+                                             +
+  Project: NewsMinds                         +
+  http://newsminds.mediacube.at/             +
+  (C) Bruenner Franz Josef, Fritsch Andreas  +
+                                             +
+++++++++++++++++++++++++++++++++++++++++++++++


This project is licensed under the MIT License.


Content:
1. About
2. To get it running
3. Fun Facts
4. Technical


1. About
--------

This is our Qualification Project for the Wintersemester 2011.

It is a social discussion platform for current news. The special spice is the
voting-system. When you create posts, the others can rate those posts and you
get points. Depending on the votes, you can get positive or negative points
accumulating to your overall scrore. So, by time you build up your individual
score.

You can find our deployed version at: http://newsminds.mediacube.at/


2. To get it running
--------------------
 
When you want it to try out for the first time you have to run
'rake db:migrate' in the console. After that you have to fill some dummy values
into the empty attributes of dailyNews and TopStory. Otherwise you get an error
reading the attributes containing nil objects. That's because we don't have a
check if those are empty. That has to be done only the very first time or
you create new empty database.


3. Fun Facts
------------

- There was a typo in the name of the daily_news_controller. It was named
  'daly_news_controller'. We were long time too lazy to fix it. The typo
  was present over the whole project.
  

4. Technical
------------

- This is a Ruby on Rails project
- Ruby version used: local: 1.9.3  server: 1.9.2
- Rails version used: 3.0.9
