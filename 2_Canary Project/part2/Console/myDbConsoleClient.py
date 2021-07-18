import mysql.connector
import os
from tabulate import tabulate

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="16171825"
)

def initDB():
    print("HELLO!")
    mycursor = mydb.cursor()
    print("HELLO2!")
    mycursor.execute('USE twitter')
    mydb.autocommit=True

# MYSQL procedures
def BlockSomeUser(listOfCommand):
    try:
        func = "BlockSomeUser"
        blocked = None
        if len(listOfCommand)>1:
            blocked = listOfCommand[1]
        if blocked == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(blocked)
        result = mycursor.callproc(func, (a))
        val = mycursor.fetchone()
        print("done")
        return
    except mysql.connector.Error as e:
        print(e)

def followSomeUser(listOfCommand):
    try:
        func = "followSomeUser"
        Followed_ = None
        if len(listOfCommand)>1:
            Followed_ = listOfCommand[1]
        if Followed_ == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(Followed_)
        result = mycursor.callproc(func, (a))
        val = mycursor.fetchone()
        # print(val)
        return
    except mysql.connector.Error as e:
        print(e)
    finally:
        mycursor.stored_results()

def getActivityOfSpecificUser(listOfCommand):
    try:
        proc = "getActivityOfSpecificUser"
        specificUser = None
        if len(listOfCommand)>1:
            specificUser = listOfCommand[1]
        if specificUser == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(specificUser)
        result = mycursor.callproc(proc, (a))
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfFollowedByUserActivity(inputCons):
    try:
        proc = "getListOfFollowedByUserActivity"
        mycursor = mydb.cursor()
        result = mycursor.callproc(proc)
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfLikedBy(inputCons):
    try:
        proc = "getListOfLikedBy"
        tweetID = None
        if len(inputCons)>1:
            tweetID = inputCons[1]
        if tweetID == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(tweetID)
        result = mycursor.callproc(proc, (a))
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfLogInsDesc(inputCons):
    try:
        proc = "getListOfLogInsDesc"
        mycursor = mydb.cursor()
        result = mycursor.callproc(proc)
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfMessagesFromAllUsers(inputCons):
    try:
        proc = "getListOfMessagesFromAllUsers"
        mycursor = mydb.cursor()
        result = mycursor.callproc(proc)
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfMessagesFromSpecificUsers(inputCons):
    try:
        proc = "getListOfMessagesFromSpecificUsers"
        user_ = None
        if len(inputCons)>1:
            user_ = inputCons[1]
        if user_ == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(user_)
        result = mycursor.callproc(proc, (a))
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfMessangers(inputCons):
    try:
        proc = "getListOfMessangers"
        mycursor = mydb.cursor()
        result = mycursor.callproc(proc)
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfMyTweets(inputCons):
    try:
        proc = "getListOfMyTweets"
        mycursor = mydb.cursor()
        result = mycursor.callproc(proc)
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfOpinionsOverSpecificTweet(inputCons):
    try:
        proc = "getListOfOpinionsOverSpecificTweet"
        tweetID = None
        if len(inputCons)>1:
            tweetID = inputCons[1]
        if tweetID == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(tweetID)
        result = mycursor.callproc(proc, (a))
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getListOfPopularTweets(inputCons):
    try:
        proc = "getListOfPopularTweets"
        mycursor = mydb.cursor()
        result = mycursor.callproc(proc)
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def getLisTOfTweetsByHashtag(inputCons):
    try:
        proc = "getLisTOfTweetsByHashtag"
        hashtag = None
        if len(inputCons)>1:
            hashtag = inputCons[1]
        if hashtag == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(hashtag)
        result = mycursor.callproc(proc, (a))
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def stopBlockingSomeUser(inputCons):
    try:
        proc = "stopBlockingSomeUser"
        user_ = None
        if len(inputCons)>1:
            user_ = inputCons[1]
        if user_ == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(user_)
        result = mycursor.callproc(proc, (a))
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

def stopFollowingUser(inputCons):
    try:
        proc = "stopFollowingUser"
        user_ = None
        if len(inputCons)>1:
            user_ = inputCons[1]
        if user_ == None:
            print("Unable to do so")
            return  
        mycursor = mydb.cursor()
        a = []
        a.append(user_)
        result = mycursor.callproc(proc, (a))
        for result in mycursor.stored_results():
            printOutput(result.fetchall())
        return
    except mysql.connector.Error as e:
        print(e)

# MYSQL Functions
def GetLastLogIn(inputCons):
    function = "select twitter.GetLastLogIn();"
    mycursor = mydb.cursor()
    result = mycursor.execute(function)
    val = mycursor.fetchone()
    mydb.commit()
    a = []
    a.append(val)
    print(val[0])
    return

def createAccount(inputCons):
    try:
        print(len(inputCons))
        if len(inputCons)!=7 and len(inputCons)!=6 :
            return
        username=inputCons[1]
        name_Of_User=inputCons[2]
        surname_=inputCons[3]
        pass_=inputCons[4]
        Date_Of_Birth_=inputCons[5]
        Bio_= ""
        if len(inputCons)!=6:
            Bio_=inputCons[6]
        function = "select twitter.createAccount('%s', '%s', '%s', '%s', '%s', '%s');"%(username, name_Of_User, surname_, pass_, Date_Of_Birth_, Bio_)
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def createOpinionAsTweet(inputCons):
    try:
        if len(inputCons)!=3:
            return
        function = "select twitter.createOpinionAsTweet('%s', %s);"%(inputCons[1], inputCons[2])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def getNumLikesOfTweet(inputCons):
    try:
        if len(inputCons)!=2:
            return
        function = "select twitter.getNumLikesOfTweet( %s);"%(inputCons[1])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def getTweeter(inputCons):
    try:
        if len(inputCons)!=2:
            return
        function = "select twitter.getTweeter( %s);"%(inputCons[1])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def isUserBlocked(inputCons):
    try:
        if len(inputCons)!=2:
            return
        function = "select twitter.isUserBlocked( '%s' );"%(inputCons[1])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def likeTweet(inputCons):
    try:
        if len(inputCons)!=2:
            return
        function = "select twitter.likeTweet( %s);"%(inputCons[1])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def logInToPlatform(inputCons):
    try:
        if len(inputCons)!=3:
            return
        function = "select twitter.logInToPlatform('%s', '%s');"%(inputCons[1], inputCons[2])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def sendMessage(inputCons):
    try:
        if len(inputCons)!=3:
            return
        function = "select twitter.sendMessage('%s', %s);"%(inputCons[1], inputCons[2])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def sendMessageWithContent(inputCons):
    try:
        if len(inputCons)!=3:
            return
        function = "select twitter.sendMessageWithContent('%s', '%s');"%(inputCons[1], inputCons[2])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

def tweet(inputCons):
    try:
        if len(inputCons)!=2:
            return
        function = "select twitter.tweet('%s');"%(inputCons[1])
        mycursor = mydb.cursor()
        result = mycursor.execute(function)
        val = mycursor.fetchone()
        mydb.commit()
        print(val[0])
        return
    except mysql.connector.Error as e:
        print(e)

#other py functions

def makeSence(listOfCommand):
    if listOfCommand!=None:
        command = listOfCommand[0]
        if command=="BlockSomeUser":
            return 1
        elif command=="followSomeUser":
            return 2
        elif command=="getActivityOfSpecificUser":
            return 3
        elif command=="getListOfFollowedByUserActivity":
            return 4
        elif command=="getListOfLikedBy":
            return 5
        elif command=="getListOfLogInsDesc":
            return 6
        elif command=="getListOfMessagesFromAllUsers":
            return 7
        elif command=="getListOfMessagesFromSpecificUsers":
            return 8
        elif command=="getListOfMessangers":
            return 9
        elif command=="getListOfMyTweets":
            return 10
        elif command=="getListOfOpinionsOverSpecificTweet":
            return 11
        elif command=="getListOfPopularTweets":
            return 12
        elif command=="getLisTOfTweetsByHashtag":
            return 13
        elif command=="stopBlockingSomeUser":
            return 14
        elif command=="stopFollowingUser":
            return 15
        #those where the procedures 
        elif command=="createAccount":
            return 16
        elif command=="createOpinionAsTweet":
            return 17
        elif command=="GetLastLogIn":
            return 18
        elif command=="getNumLikesOfTweet":
            return 19
        elif command=="getTweeter":
            return 20
        elif command=="isUserBlocked":
            return 21
        elif command=="likeTweet":
            return 22
        elif command=="logInToPlatform":
            return 23
        elif command=="sendMessage":
            return 24
        elif command=="sendMessageWithContent":
            return 25
        elif command=="tweet":
            return 26
        #those where the functions 
        elif command=="exit":
            return 27
        elif command=="help":
            return 28
    return -1

def runCommand(inputCons, valid):
    if valid==1:
        BlockSomeUser(inputCons)
    elif valid==2:
        followSomeUser(inputCons)
    elif valid==3:
        getActivityOfSpecificUser(inputCons)
    elif valid==4:
        getListOfFollowedByUserActivity(inputCons)
    elif valid==5:
        getListOfLikedBy(inputCons)
    elif valid==6:
        getListOfLogInsDesc(inputCons)
    elif valid==7:
        getListOfMessagesFromAllUsers(inputCons)
    elif valid==8:
        getListOfMessagesFromSpecificUsers(inputCons)
    elif valid==9:
        getListOfMessangers(inputCons)
    elif valid==10:
        getListOfMyTweets(inputCons)
    elif valid==11:
        getListOfOpinionsOverSpecificTweet(inputCons)
    elif valid==12:
        getListOfPopularTweets(inputCons)
    elif valid==13:
        getLisTOfTweetsByHashtag(inputCons)
    elif valid==14:
        stopBlockingSomeUser(inputCons)
    elif valid==15:
        stopFollowingUser(inputCons)
    #those where the procedures 
    elif valid==16:
        createAccount(inputCons)
    elif valid==17:
        createOpinionAsTweet(inputCons)
    elif valid==18:
        GetLastLogIn(inputCons)
    elif valid==19:
        getNumLikesOfTweet(inputCons)
    elif valid==20:
        getTweeter(inputCons)
    elif valid==21:
        isUserBlocked(inputCons)
    elif valid==22:
        likeTweet(inputCons)
    elif valid==23:
        logInToPlatform(inputCons)
    elif valid==24:
        sendMessage(inputCons)
    elif valid==25:
        sendMessageWithContent(inputCons)
    elif valid==26:
        tweet(inputCons)
    #those where the functions 
    elif valid==27:
        os.exit()
    elif valid==28:
        printHelp()
        return 

def inputFromConsole():
    inputCons = input().split(' ')
    inputConsCopy = []
    started = False
    quote = []
    for i in range(0, len(inputCons)):
        if inputCons[i][0]=="\"":
            quote=[]
            started=True
            quote.append(inputCons[i][1:len(inputCons[i])])
        elif started and not inputCons[i][-1]=="\"":
            quote.append(inputCons[i])
        elif started and inputCons[i][-1]=="\"":
            quote.append(inputCons[i][0:-1])
            started = False
            quote = " ".join(quote)
            inputConsCopy.append(quote)
            quote = []
        elif not started:
            inputConsCopy.append(inputCons[i])
    inputCons = inputConsCopy
    valid = makeSence(inputCons)
    while(valid==-1):
        inputCons = input().split(' ')
    if valid == 27:
        return False
    valid = makeSence(inputCons)
    runCommand(inputCons, valid)
    
def printOutput(data):
    print(tabulate(data, tablefmt='psql'))

def printHelp():
    print('------- the commands you can use -------')
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
    print('  28. help')
    # print('  those where all the functions')
    print('----------------------------------------')

def mainFunction():
    #user comes you the program shows the commands supported
    printHelp()
    while(True):
        exit = inputFromConsole()
        if exit==False:
            print("thanks for using our project")
            return

if __name__ == '__main__':
    initDB()
    mainFunction()
