import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.io.FileReader;
import java.util.List;

public class FirstProject {

    //address of your redis server
    public static final String hostname = "localhost";
    public static final int port = 6363;
    public static final int redisDB = 2;

    //the jedis connection pool..
    private static JedisPool pool = null;

    private static Jedis jedis = null;
    public void JedisMain() {
        //configure our pool connection
//        pool = new JedisPool(redisHost, redisPort);

    }
    public static void main(String[] args) {
        //get a jedis connection jedis connection pool
//        jedis = pool.getResource();
        readAllDataAtOnce("./resources/NYSE_20210301.csv");
    }


    public static void readAllDataAtOnce(String file)
    {
        try {
            // Create an object of file reader
            // class with CSV file as a parameter.
            FileReader filereader = new FileReader(file);

            // create csvReader object
            CSVReader csvReader = new CSVReaderBuilder(filereader)
                    .build();
            List<String[]> allData = csvReader.readAll();

            // print Data
            for (String[] row : allData) {
                for (String cell : row) {
                    System.out.print(cell + "\t");
                }
                System.out.println();
            }
        }
        catch (Exception e) {
            e.printStackTrace();
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
//        try {
//            //save to redis
//            jedis.sadd(key, member1, member2, member3);
//
//            //after saving the data, lets retrieve them to be sure that it has really added in redis
//            Set members = jedis.smembers(key);
//            for (String member : members) {
//                System.out.println(member);
//            }
//        } catch (JedisException e) {
//            //if something wrong happen, return it back to the pool
//            if (null != jedis) {
//                pool.returnBrokenResource(jedis);
//                jedis = null;
//            }
//        } finally {
//            ///it's important to return the Jedis instance to the pool once you've finished using it
//            if (null != jedis)
//                pool.returnResource(jedis);
//        }
//    }
}
