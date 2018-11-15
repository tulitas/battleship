package lv.tsi.battleship;

import lv.tsi.battleship.model.*;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegistrationServlet", urlPatterns = "/registration")
public class RegistrationServlet extends HttpServlet {
    @Inject
    private MyGame myGame;
    @Inject
    private ErrorHolder errorHolder;
    @Inject
    private GameManager gameManager;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String un = request.getParameter("username");
        if (un == null || un.isBlank()) {
            errorHolder.setMessage("User name is required");
            doGet(request, response);
            return;
        }
        User user = new User();
        user.setName(un);
        myGame.setUser(user);

        Game game = gameManager.setupGame(user);
        myGame.setGame(game);

        if (game.isCompleted()) {
            response.sendRedirect("/battleship/shipplacement");
        } else {
            response.sendRedirect("/battleship/waitregistration");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/registration.jsp")
                .include(request, response);
    }
}
