#create a new account in this platform, if any of the given passed are not validated an error will appear indicating so, for example
#i have already run this query so running it againg will create an error saying this user already exists
insert Into user(Username, Name_, Surname, Pass, Date_Of_Birth, Bio)
values("newUserCreated", "myName", "mySurname", sha1("000000"), '2016-10-27', "I am a new User in this awesome platform" );