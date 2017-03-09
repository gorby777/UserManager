package application.controller;

import java.sql.*;

/*
 * Класс для создания и наполнения БД
 */
public class DBCreation{

    private static final String URL0 = "jdbc:mysql://localhost:3306?useSSL=false";
    private static final String URL = "jdbc:mysql://localhost:3306/test?useSSL=false";
    private static final String LOGIN = "root";
    private static final String PASSWORD = "root";

    private Connection connection;

    private Connection getConnection() {
        try {
            connection = DriverManager.getConnection(URL,LOGIN,PASSWORD);
        } catch (SQLException e) {
            this.createDB();
            this.getConnection();
        }
        return connection;
    }

    //Создаём базу test и таблицу test.user
    public void createDB() {
        try {
            connection = DriverManager.getConnection(URL0,LOGIN,PASSWORD);
            Statement statement = connection.createStatement();
            statement.addBatch("create schema if not exists test;");
            statement.addBatch("CREATE TABLE IF NOT EXISTS TEST.USER (ID INT(8) NOT NULL AUTO_INCREMENT, " +
                    "NAME VARCHAR(25) NOT NULL, AGE INT(3) NOT NULL, ADMIN BIT(1) NOT NULL, " +
                    "DATE TIMESTAMP(1) NOT NULL, PRIMARY KEY (ID));");
            statement.executeBatch();
            //Проверяем наличие данных в таблице
            ResultSet rs = statement.executeQuery("select id from test.user");
            int allRows=0;
            while(rs.next()){allRows++;}
            if(allRows>0)return;
            //Если таблица пуста заполняем её данными
            String sql ="INSERT INTO test.user (name, age, admin, date) VALUES\n" +
                    "  ('Alex', 30, 0, '2014-10-31 16:30:40'),\n" +
                    "  ('Bob', 27, 1, '2009-05-30 08:10:00'),\n" +
                    "  ('Nick', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Fred', 50, 0, '2014-02-15 16:30:50'),\n" +
                    "  ('Abel', 18, 0, '2016-03-30 16:30:40'),\n" +
                    "  ('Adam', 27, 1, '2016-05-31 08:11:09'),\n" +
                    "  ('Abraham', 22, 0, '2015-11-15 01:15:30'),\n" +
                    "  ('Sonya', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Brenda', 24, 0, '2011-09-11 16:30:50'),\n" +
                    "  ('Helen', 30, 0, '2012-11-23 16:30:40'),\n" +
                    "  ('Samanta', 17, 1, '2015-05-13 08:00:00'),\n" +
                    "  ('Carter', 49, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('John', 18, 0, '2014-09-23 16:30:50'),\n" +
                    "  ('Silvio', 21, 0, '2010-09-02 16:30:40'),\n" +
                    "  ('Barbara', 16, 1, '2015-11-03 08:20:22'),\n" +
                    "  ('Nancy', 40, 0, '2015-11-15 01:15:30'),\n" +
                    "  ('Tom', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Bruce', 18, 0, '2012-09-25 16:30:50'),\n" +
                    "  ('Brenda', 19, 0, '2010-11-23 16:30:40'),\n" +
                    "  ('Nicolas', 50, 1, '2008-05-24 08:00:00'),\n" +
                    "  ('Bruce', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Sonya', 18, 0, '2014-01-29 16:30:50'),\n" +
                    "  ('Adam', 30, 0, '2007-09-01 16:30:40'),\n" +
                    "  ('Helen', 27, 1, '2015-01-23 08:00:00'),\n" +
                    "  ('Barbara', 40, 0, '2015-11-15 01:15:30'),\n" +
                    "  ('Carter', 48, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Samanta', 60, 0, '2003-09-11 16:30:50'),\n" +
                    "  ('Tom', 40, 0, '2010-09-29 16:30:40'),\n" +
                    "  ('John', 27, 1, '2015-05-05 08:00:00'),\n" +
                    "  ('Abraham', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Silvio', 18, 0, '2010-09-15 16:30:50'),\n" +
                    "  ('Abel', 30, 0, '2011-04-27 16:30:40'),\n" +
                    "  ('Nancy', 27, 1, '2015-09-09 08:00:00'),\n" +
                    "  ('Samanta', 40, 0, '2015-11-15 01:15:30'),\n" +
                    "  ('Brenda', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Sonya', 25, 0, '2012-12-13 16:30:50'),\n" +
                    "  ('Adam', 30, 0, '2016-09-28 16:30:40'),\n" +
                    "  ('Sonya', 37, 1, '2015-05-07 08:00:00'),\n" +
                    "  ('Abel', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Carter', 38, 0, '2010-09-20 16:30:50'),\n" +
                    "  ('Helen', 30, 0, '2014-04-15 16:30:40'),\n" +
                    "  ('Barbara', 27, 1, '2014-05-06 08:00:00'),\n" +
                    "  ('John', 40, 0, '2015-11-15 01:15:30'),\n" +
                    "  ('Samanta', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Sonya', 18, 0, '2014-09-23 16:30:50'),\n" +
                    "  ('Nancy', 30, 0, '2005-10-23 16:30:40'),\n" +
                    "  ('Abel', 55, 1, '2016-05-11 08:00:00'),\n" +
                    "  ('Carter', 17, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Helen', 29, 0, '2016-12-13 16:30:50'),\n" +
                    "  ('Silvio', 26, 0, '2007-09-16 16:30:40'),\n" +
                    "  ('Brenda', 17, 1, '2015-05-24 08:00:00'),\n" +
                    "  ('Tom', 55, 0, '2015-11-15 01:15:30'),\n" +
                    "  ('John', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Carter', 26, 0, '2014-06-21 16:30:50'),\n" +
                    "  ('Samanta', 30, 0, '2012-09-24 16:30:40'),\n" +
                    "  ('Abel', 27, 1, '2010-05-26 08:00:00'),\n" +
                    "  ('Barbara', 24, 1, '2013-08-25 14:30:27'),\n" +
                    "  ('Helen', 33, 0, '2016-06-15 16:30:50'),\n" +
                    "  ('Sonya', 17, 0, '2012-09-01 16:30:40'),\n" +
                    "  ('Barbara', 27, 1, '2011-05-03 08:00:00'),\n" +
                    "  ('Brenda', 40, 0, '2015-11-15 01:15:30');";

            statement.execute(sql);
            statement.close();
            connection.close();
        } catch (SQLException e) {
            getConnection();
            System.out.println("Ошибка создания БД " + e);
        }
    }
}
