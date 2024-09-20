package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    public Connection recuperarConexao() {
        try {
            return DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/mercado_facil?user=root&password=root");
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
