import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.io.File;
import java.io.FileReader;
import java.util.List;

public class FirstProject {

    //address of your redis server
    public static final String hostname = "localhost";
    public static Jedis jedis = null;

    public static final String dbPath = "./resources/NYSE_20210301.csv";

    public static boolean startDb(){
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
            return true;
        }

        return true;
    }

    public static void main(String[] args) {

        startDb();
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


//    private static boolean delete(String key){
//
//    }
//
//    private static boolean fetch(String key){
//
//    }
//
//    private static boolean update(String key, String value){
//
//    }
//


//    private static boolean create(String key, String value){
//
//    }
}
