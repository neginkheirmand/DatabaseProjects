import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import redis.clients.jedis.Jedis;
import java.util.Scanner;
import java.io.File;
import java.io.FileReader;
import java.util.List;

public class FirstProject {

    //address of your redis server
    public static final String hostname = "localhost";
    public static Jedis jedis = null;

    public static final String dbPath = "./resources/NYSE_20210301.csv";

    public static void startDb(){
        //Connecting to Redis on localhost
        jedis = new Jedis(hostname);
        File f = new File(dbPath);
        if(!f.exists() || f.isDirectory()){
            System.out.println("could not find file of db so will create a new one");
        }else {
            //at the start we should load all the data stored in the csv file
            List<String[]> data = readAllDataAtOnce(dbPath);
            //now load it into cache(redis db) for that we should manually add each of the key value pairs
            for (int i = 0; i < 10; i++) {
                if (data.get(i)[0].length() != 0 && data.get(i)[1].length() != 0) {
                    //go and add them to db
                    //adding:
                    jedis.set(data.get(i)[0], data.get(i)[1]);
                }
            }
        }

    }

    public static void main(String[] args) {
        //now the jedis object was created
        startDb();
        Scanner scanner = new Scanner(System.in);
        while(true){
            String[] command = scanner.nextLine().split(" ");
            if (command.length>=2){
                if(command[0].equals("create")){
                    System.out.println("came to create");
                    if(command.length==3) {
                        create(command[1], command[2]);
                    }
                }else if(command[0].equals("delete")){
                    System.out.println("came to delete");

                }else if(command[0].equals("update")){
                    System.out.println("came to update");

                }else if(command[0].equals("fetch")){
                    System.out.println("came to fetch");

                }
                //since it is said the only those 4 command are acceptable, if any other ones
                //are entered, will be ignored
            }
        }
    }


    public static List<String[]> readAllDataAtOnce(String file)
    {
        try {
            // Create an object of file reader
            // class with CSV file as a parameter.
            FileReader filereader = new FileReader(file);

            // create csvReader object
            CSVReader csvReader = new CSVReaderBuilder(filereader)
                    .build();
            List<String[]> allData = csvReader.readAll();
            return allData;
//
//            // print Data
//            for (String[] row : allData) {
//                for (String cell : row) {
//                    System.out.print(cell + "\t");
//                }
//                System.out.println();
//            }
        }
        catch (Exception e) {
            return null;
        }
    }


    private static boolean fetch(String key){
        return true;
    }

    private static boolean delete(String key){
        return true;
    }

    private static boolean update(String key, String value){
        return true;
    }



    private static boolean create(String key, String value){
        System.out.println(key);
        System.out.println(value);
        return true;
    }
}
