package service;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

public class MyBatisConnector {
    // single-ton pattern:
    // 객체1개만생성해서 지속적으로 서비스하자
    static MyBatisConnector single = null;

    public static MyBatisConnector getInstance() {
        // 생성되지 않았으면 생성
        if (single == null)
            single = new MyBatisConnector();
        // 생성된 객체정보를 반환
        return single;
    } // end of getInstance()

    SqlSessionFactory factory;

    private MyBatisConnector() {
        try {
            Reader reader = Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");
            factory = new SqlSessionFactoryBuilder().build(reader);
            reader.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    } // end of constructor

    public SqlSessionFactory getFactory() {
        return factory;
    } // end of getFactory();

} // end of class
