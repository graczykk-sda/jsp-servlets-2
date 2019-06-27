package pl.sdacademy.jsp.servlets;

import pl.sdacademy.jsp.db.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(
        name = "tweeter-servlet",
        urlPatterns = "/tweeter-servlet"
)
public class TweeterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String tweet = req.getParameter("tweet");
        if (tweet != null) {
            storeInDb(tweet);
        }
        List<String> allTweets = getAllTweets();
        req.getSession().setAttribute("tweets", allTweets);
        resp.sendRedirect("board.jsp");
    }

    private void storeInDb(String tweet) {
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "INSERT INTO `tweeter`.`tweets` (`idtweet`, `tweet`) VALUES (null , ?); "
            );
            preparedStatement.setString(1, tweet);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private List<String> getAllTweets() {
        List<String> allTweets = new ArrayList<>();
        Connection connection = DatabaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "SELECT * from tweets");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String tweet = resultSet.getString("tweet");
                allTweets.add(tweet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return allTweets;
    }
}
