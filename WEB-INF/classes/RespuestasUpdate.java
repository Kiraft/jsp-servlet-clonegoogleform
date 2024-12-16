import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "RespuestasUpdate", urlPatterns = { "/RespuestasUpdate" })
public class RespuestasUpdate extends HttpServlet {

    String url = "jdbc:postgresql://127.0.0.1:5432/formdb";
    String usuario = "postgres";
    String clave = "";



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] respuestas = req.getParameterValues("respuesta");



        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "UPDATE respuesta SET votaciones = votaciones + 1 WHERE id = ?";

        for (String r : respuestas) {

            try (Connection conn = DriverManager.getConnection(url, usuario, clave); 
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
                
                pstmt.setInt(1, Integer.parseInt(r));
                
                int filasAfectadas = pstmt.executeUpdate();

                if (filasAfectadas > 0) {
                    System.out.println("ACTUALIZADO CON EXITO");
                } else {
                    System.out.println("NO SE ACTUALIZO NADA");
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
            
        }

        resp.sendRedirect("http://localhost:8080/bajas/");
    }

}



