import mysql.connector
import os

mydb = mysql.connector.connect(
  host="localhost",
  user="Negin Kheirmand",
  passwd="22526637"
)

def initDB():
    mycursor = mydb.cursor()
    mycursor.execute('USE twitter')

def displayMainMenu():
    print('------- MENU -------')
    print('  1. BlockSomeUser')
    print('  2. followSomeUser')
    print('  3. getActivityOfSpecificUser')
    print('  4. getListOfFollowedByUserActivity')
    print('  5. getListOfLikedBy')
    print('  6. getListOfLogInsDesc')
    print('  7. getListOfMessagesFromAllUsers')
    print('  8. getListOfMessagesFromSpecificUsers')
    print('  9. getListOfMessangers')
    print('  10. getListOfMyTweets')
    print('  11. getListOfOpinionsOverSpecificTweet')
    print('  12. getListOfPopularTweets')
    print('  13. getLisTOfTweetsByHashtag')
    print('  14. stopBlockingSomeUser')
    print('  15. stopFollowingUser')
    # print("those where the procedure")
    print('  16. createAccount')
    print('  17. createOpinionAsTweet')
    print('  18. GetLastLogIn')
    print('  19. getNumLikesOfTweet')
    print('  20. getTweeter')
    print('  21. isUserBlocked')
    print('  22. likeTweet')
    print('  23. logInToPlatform')
    print('  24. sendMessage')
    print('  25. sendMessageWithContent')
    print('  26. tweet')
    print('  27. exit')
    # print('  those where all the functions')
    print('--------------------')

def exit():
    n = int(input(" Press 27 to exit : "))

    if n == 27:
        os.system('cls')  # For Windows
        run()
    else:
        print(" Invalid Option")
        exit()

def registerUser():

    mycursor = mydb.cursor()

    print('------ User Registration ------\n')
    
    name =  input('Enter user name : ')
    age =  int(input('Enter user age : '))
    telNo = int(input('Enter user contact number : '))

    sql = 'INSERT INTO `user` (`NAME`,`AGE`,`TELEPHONE_NUMBER`) VALUES (%s,%s,%s)'
    val = (name,age,telNo)
    mycursor.execute(sql,val)
    mydb.commit()

    print('------ SUCCESS ------\n')
    exit()

def getAllUsers():
    
    mycursor = mydb.cursor()
    print('------ All Users ------\n')
    mycursor.execute("SELECT * FROM user")
    userList = mycursor.fetchall()
    i = 0
    for user in userList:
        i += 1
        print(" ----- User ",i,"-----")
        print(" Username : ", user[1])
        print(" Age : ", user[2])
        print(" Contact Number : ", user[3])
        print("\n")
    print('------ SUCCESS ------\n')
    exit()

def getAllPosts():
    
    mycursor = mydb.cursor()
    print('------ All Posts ------\n')
    mycursor.execute("SELECT * FROM post")
    postList = mycursor.fetchall()

    i = 0
    for post in postList:
        i += 1
        print(" ----- Post ",i,"-----")
        print(" Caption : ", post[1])
        val = post[3]
        sql = 'SELECT * FROM user WHERE ID=' + str(val)
        
        mycursor.execute(sql)
        user = mycursor.fetchall()
        
        print(" User ID : ", post[3])
        print(" User Name : ", user[0][1])
        print(" Description : ", post[2])
        
        print("\n")

    print('------ SUCCESS ------\n')
    exit()

def getAllPostsByUser():
    
    mycursor = mydb.cursor()
    print('------ Get All Posts By User ------\n')
    n = int(input("Enter User ID : "))
    sql = 'SELECT * FROM user WHERE ID=' + str(n)                 
    mycursor.execute(sql)
    user = mycursor.fetchall()

    if len(user) == 0:
        print(" The user id is not exits")
    else:
        print(" ----- User -----")
        print(" Username : ", user[0][1])
        print(" Age : ", user[0][2])
        print(" Contact Number : ", user[0][3])
        print("\n")

        print('------ ',user[0][1],'\'s All Posts ------\n')

        sql = 'SELECT * FROM post WHERE USER_ID=' + str(n)
        mycursor.execute(sql)
        postList = mycursor.fetchall()

        i = 0
        for post in postList:
            i += 1
            
            print(" ----- Post ",i,"-----")
            print(" Caption : ", post[1])
            print(" Description : ", post[2])
            
            print("\n")

        if len(postList) == 0:
            print(" ----- No posts available -----")

    print('------ SUCCESS ------\n')
    exit()
        

    

    

def run():
    displayMainMenu()
    n = int(input("Enter option : "))
    if n == 1:
        os.system('cls')  # For Windows
        registerUser()
    elif n == 2:
        os.system('cls')
        getAllUsers()
    elif n == 3:
        os.system('cls')
        getAllPosts()
    elif n == 4:
        os.system('cls')
        getAllPostsByUser()
    elif n == 5:
        os.system('cls')
        print('----- Thank You -----')
    else:
        os.system('cls')
        run()
        

    
    
if __name__ == '__main__':
    initDB()
    run()
           
            
    
    
