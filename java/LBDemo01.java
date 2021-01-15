// package mysql.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.mysql.jdbc.ReplicationDriver;


public class LBDemo01 {
   
    private static long ttltime=0;
    private static String driver = "com.mysql.jdbc.Driver";
    // private static String driver = "com.mysql.jdbc.ReplicationDriver";
    private static String database = "test";
    // private static String baseUrl =   "jdbc:mysql:replication://" + 
    private static String baseUrl =   "jdbc:mysql://" +
	"address=(protocol=tcp)(type=master)(host=127.0.0.1)(port=6446)/" + 
            database + "?verifyServerCertificate=false&useSSL=true&" +
            "loadBalanceConnectionGroup=first&loadBalanceEnableJMX=true";
    private static String user = "root";
    private static String password = "welcome1";

    public static void main(String[] args) throws Exception {

        createTable();
       
        ArrayList threads = new ArrayList(10);;
        for (int i=0;i<3;i++) {
            Thread t = new Thread(new Repeater());
            t.start();
            threads.add(t);
        }
       
        System.out.println("Spawned threads : " + threads.size());
        for(int i=0;i<threads.size();i++) {
            ((Thread) threads.get(i)).join();
        }
        System.out.println("Finished - " + ttltime);
       

    }
   
    private static void createTable() throws ClassNotFoundException, SQLException {
        Connection c = getNewConnection();
       
         try {
                c.setAutoCommit(false);
                Statement s = c.createStatement();
                s.executeUpdate("create table if not exists test.mytable (f1 int auto_increment not null primary key, f2 varchar(200)) engine=innodb;");
                c.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        c.close();
   
    }
   
    static Connection getNewConnection( ) throws SQLException, ClassNotFoundException {
        java.util.Properties pp = new java.util.Properties();
       
        pp.setProperty("user", user);
        pp.setProperty("password", password);
        // black list for 60seconds
        pp.setProperty("loadBalanceBlacklistTimeout", "60000");
        pp.setProperty("autoReconnect", "false");
	if (driver.equals("com.mysql.jdbc.ReplicationDriver")) {
		ReplicationDriver dr = new ReplicationDriver();
		System.out.println("Using ReplicationDriver");
		return dr.connect(baseUrl, pp);
	} else {
           Class.forName(driver);
           return DriverManager.getConnection(baseUrl, pp);
	}


    }
   
    static void executeSimpleTransaction(Connection c, int conn, int trans){
        try {
	    c.setReadOnly(false);
            c.setAutoCommit(false);
            Statement s = c.createStatement();

            s.executeUpdate("insert into test.mytable (f2) values ('Connection: " + conn + ", transaction: " + trans +"');" );
            c.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
   
     public static class Repeater implements Runnable {
            public void run() {
                for(int i=0; i < 1000; i++){
                    try {
                        Connection c = getNewConnection();
                        long mystart, myend, myttl=0;
                        for(int j=0; j < 10; j++){
                            // To register the start time
                            mystart = System.currentTimeMillis();
                            executeSimpleTransaction(c, i, j);
                            // To time the execution time and save it onto the totaltime
                            myend = System.currentTimeMillis();
                            myttl += (myend - mystart);
                            incTTL(myttl);
                           
                            Thread.sleep(Math.round(100 * Math.random()));
                        }
                       
                        c.close();
                        Thread.sleep(200);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
   
     public synchronized static void incTTL(long m) {
         ttltime += m;
     }
}

