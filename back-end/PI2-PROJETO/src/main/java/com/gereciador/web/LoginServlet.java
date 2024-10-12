package com.gereciador.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gerenciador.dao.ConnectionFactory;
import com.gerenciador.dao.UsuarioDAO;
import com.model.Usuario;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Obtém os parâmetros do formulário de login
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        Connection connection = null;
        try {
            // Cria uma conexão com o banco de dados
            connection = new ConnectionFactory().getConnection();
            
            // Instancia o UsuarioDAO com a conexão
            UsuarioDAO usuarioDAO = new UsuarioDAO(connection);

            // Verifica se o usuário existe no banco de dados
            Usuario usuario = usuarioDAO.buscarPorEmailSenha(login, senha);

            if (usuario != null) {
                // Login bem-sucedido, cria uma sessão para o usuário
                HttpSession session = request.getSession();
                session.setAttribute("usuarioLogado", usuario);
                
                // Redireciona para a dashboard (um arquivo .html)
                response.sendRedirect(request.getContextPath() + "/dashboard");
            } else {
                // Falha no login, redireciona de volta para o login com erro
                response.sendRedirect("index.html?error=true");
            }

        } catch (SQLException e) {
            throw new ServletException("Erro ao conectar ao banco de dados", e);
        } finally {
            // Fecha a conexão com o banco de dados
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
